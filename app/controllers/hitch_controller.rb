# frozen_string_literal: true

class HitchController < ApplicationController
  # Create a new Tumpang
  def create
    submit_time = DateTime.iso8601(params[:submit_time])
    hitch = Hitch.create(
      submit_time: params[:submit_time],
      pickup: params[:pickup],
      user: current_user(params[:user_id]),
      restaurant_id: params[:restaurant_id]
    )

    serializer = HitchSerializer.new(hitch, { params: { current_user: current_user(params) } })

    render json: serializer.serializable_hash
  end

  # Get all hitches that are active
  def get_all
    hitches = ::Hitch.all1

    serializer = HitchSerializer.new(hitches, { params: {coordinates: params['coordinates']} })
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
