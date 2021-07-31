class RestaurantController < ApplicationController
  def create
    begin
      restaurant = Restaurant.find(params[:id])
      restaurant.update(
        restaurant_params
      )
    rescue => e

      restaurant = Restaurant.create(
        restaurant_params
      )
    end
    render json: {restaurant: restaurant}, status: 200
  end

  private
  
  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :street, :stripe_id, :state, :country, :latitude, :longitude).select { |k,v| !v.blank?}
  end
end