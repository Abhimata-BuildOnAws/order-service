# frozen_string_literal: true

class HitchSerializer
  include JSONAPI::Serializer

  attributes :pickup, :total_pollution

  # Returns a straight distance (not accounting route distance) from restaurant to the user in metres
  attribute :absolute_distance do |hitch, params|
    hitch.distance_to([params[:user_longitude], params[:user_longitude]])
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
end
