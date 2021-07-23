class RestaurantController < ApplicationController
  def create
    restaurant = Restaurant.create(
      name: params[:name],
      street: params[:address],
      stripe_id: params[:stripe_id],
      state: params[:state],
      country: params[:country],
      latitude: params[:latitude],
      longitude: params[:longitude]
    )

    render json: {restaurant: restaurant}, status: 200
  end
end