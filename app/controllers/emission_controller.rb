class EmissionController < ApplicationController
  def emission_history
    month_range = params[:month_range].to_i
    user_id = params[:user_id]
    dates = generate_dates(month_range)

    from_time = month_range.months.ago
    to_time = Time.now
    hitches = Hitch.joins(:orders).where(orders: {user_id: user_id}, hitches: {submit_time: from_time..to_time})
    monthly_emissions = []
    (dates).each do |date|
      monthly = monthly_emission(date, user_id, hitches)
      monthly_emissions.append(monthly)
    end

    serializer = EmissionRecordSerializer.new(monthly_emissions)

    render json: { user_id: user_id, monthly_emissions: serializer.serializable_hash }, status: 200
    
  end

  def history_by_month_range
    month_range = params[:month_range].to_i
    user_id = params[:user_id]

    from_time = month_range.months.ago
    to_time = Time.now

    hitches = Hitch.joins(:orders).where(orders: {user_id: user_id}, hitches: {submit_time: from_time..to_time})
    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  private

  def generate_dates(month_range)
    dates = []

    (0..month_range).each do |n|
      dates.append(n.months.ago)
    end

    return dates
  end

  def monthly_emission(date, user_id, hitches)
    hitches = hitches.where('extract(month from hitches.submit_time) = ?', date.month)

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
end