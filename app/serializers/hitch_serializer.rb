# frozen_string_literal: true

class HitchSerializer
  include JSONAPI::Serializer

  attributes :pickup, :total_pollution, :description, :restaurant_id, :submit_time, :shared?

  # Returns the name of the restaurant
  attribute :restaurant_name do |hitch|
    hitch.restaurant.name
  end

  # Returns a straight distance (not accounting route distance) from restaurant to the user in metres
  attribute :absolute_distance do |hitch, params|
    hitch.distance_to([params[:user_latitude], params[:user_longitude]]) * 1000
  end

  # Returns the route distance from restaurant to the user in metres
  attribute :travel_distance do |hitch, params|
    @restaurant = hitch.restaurant
    @distance = get_distance(hitch)
  end

  # Calculates effective pollution for each customer that hitches onto this delivery
  # In grams
  attribute :effective_pollution do |hitch|
    @effective_pollution = hitch.each_pollution
  end


  def self.get_distance(obj)
    obj.travel_distance
  end

  attribute :delivery_from do
    @restaurant.address
  end

  # tree point = effective_pollution - 700
  # if effective_pollution > 700, minus points
  # if < 700, plus points
  attribute :tree_point do |hitch|
    hitch.tree_points
  end

  attribute :discount do |hitch|
    hitch.orders.count
  end

  attribute :number_of_orders do |hitch|
    hitch.orders.count
  end
end
