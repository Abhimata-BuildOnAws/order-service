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
      description: params[:description]
    )

    serializer = HitchSerializer.new(hitch, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })

    render json: serializer.serializable_hash
  end

  # Get all hitches that are active
  def get_all
    hitches = ::Hitch.where("submit_time > now()")

    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end

  # Get active hitches within 5km
  def nearby
    hitches = ::Hitch.where("submit_time > now() ").near([params[:user_latitude],params[:user_longitude]], 5)
    serializer = HitchSerializer.new(hitches, { params: { user_latitude: params[:user_latitude], user_longitude: params[:user_longitude] } })
    render json: serializer.serializable_hash
  end
  
  private

  # Retrieve current location of user
  def current_location
    ip = request.remote_ip
    results = Geocoder.search(ip)
    results.first.address
  end
end