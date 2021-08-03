# frozen_string_literal: true

class HitchController < ApplicationController
  # Create a new Tumpang
  def create
    submit_time = DateTime.iso8601(params[:submit_time])
    hitch = Hitch.create(
      submit_time: params[:submit_time],
      latitude: params[:latitude],
      longitude: params[:longitude],
      user_id: params[:user_id],
      restaurant_id: params[:restaurant_id],
      description: params[:description],
      shared?: params[:shared].to_s.downcase == 'true'
    )

    serializer = HitchSerializer.new(hitch, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })

    render json: serializer.serializable_hash
  end

  # Get all hitches that are active
  def get_all
    hitches = ::Hitch.where("submit_time > now()").near([params[:user_latitude],params[:user_longitude]], 20)

    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  def history_by_month_range
    month_range = params[:month_range].to_i
    user_id = params[:user_id]

    from_time = month_range.months.ago
    to_time = Time.now

    hitches = ::Hitch.where(user_id: user_id, created_at: from_time..to_time)
    render json: { hitches: hitches }, status: 200
  end

  # Get active hitches within 5km
  def nearby
    hitches = ::Hitch.where("submit_time > now() ").near([params[:user_latitude],params[:user_longitude]], 2)
    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  # Get active hitches for the same restaurant
  def nearby_hitches_for_restaurant
    hitches = ::Hitch.where("submit_time > now() ", restaurant_id: params[:restaurant_id]).near([params[:user_latitude],params[:user_longitude]], 2)
    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  def emission_record_by_month_record
    month_range = params[:month_range].to_i
    user_id = params[:user_id]

    dates = generate_dates(month_range)

    monthly_emissions = []
    (dates).each do |date|
      monthly = monthly_emission(date, user_id)
      monthly_emissions.append(monthly)
    end

    serializer = EmissionRecordSerializer.new(monthly_emissions)

    render json: { user_id: user_id, monthly_emissions: serializer.serializable_hash }, status: 200
  end
  private

  # Retrieve current location of user
  def current_location
    ip = request.remote_ip
    results = Geocoder.search(ip)
    results.first.address
  end

  def monthly_emission(date, user_id)
    hitches = Hitch.where(user_id: user_id).where('extract(month from created_at) = ?', date.month)

    emission_record = EmissionRecord.new()
    emission_record.month = date.strftime("%B")

    return emission_record if hitches.empty?

    emission_record.carbon_emission = hitches.sum(:total_pollution)

    carbon_saved = 0
    effective_pollution = 0

    hitches.each do |hitch|
      carbon_saved += hitch.pollution_saved
      effective_pollution += hitch.each_pollution
    end

    emission_record.carbon_emission_saved = carbon_saved
    emission_record.effective_carbon_emission = effective_pollution
    emission_record.number_of_tumpang = hitches.count
    emission_record.average_carbon_emission = effective_pollution / hitches.count


    return emission_record
  end

  def generate_dates(month_range)
    dates = []

    (0..month_range).each do |n|
      dates.append(n.months.ago)
    end

    return dates
  end
end