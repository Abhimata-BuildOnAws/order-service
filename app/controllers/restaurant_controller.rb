class RestaurantController < ApplicationController
  def create
    begin
      restaurant = Restaurant.find(params[:id])
      restaurant.update(
        name: params[:name],
        street: params[:street],
        stripe_id: params[:stripe_id],
        state: params[:state],
        country: params[:country],
        latitude: params[:latitude],
        longitude: params[:longitude]
      )
    rescue => e
      restaurant = Restaurant.create(
        id: params[:id],
        name: params[:name],
        street: params[:street],
        stripe_id: params[:stripe_id],
        state: params[:state],
        country: params[:country],
        latitude: params[:latitude],
        longitude: params[:longitude]
      )
    end
    render json: {restaurant: restaurant}, status: 200
  end
end