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
    hitches = ::Hitch.where(shared?: true).where("submit_time > now()").near([params[:user_latitude],params[:user_longitude]], 20)

    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  # Get active hitches within 5km
  def nearby
    hitches = ::Hitch.where(shared?: true).where("submit_time > now()").near([params[:user_latitude],params[:user_longitude]], 2)
    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  # Get active hitches for the same restaurant
  def nearby_hitches_for_restaurant
    hitches = ::Hitch.where(shared?: true, restaurant_id: params[:restaurant_id]).where("submit_time > now()").near([params[:user_latitude],params[:user_longitude]], 2)
    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  # Get route from restaurant to pickup for a tumpang
  def route
    hitch = Hitch.find(params[:hitch_id])
    render json: hitch.geojson
  end

  private

  # Retrieve current location of user
  def current_location
    ip = request.remote_ip
    results = Geocoder.search(ip)
    results.first.address
  end
end