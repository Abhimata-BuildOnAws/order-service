# frozen_string_literal: true

class Hitch < ApplicationRecord
  has_many :orders
  belongs_to :user
  belongs_to :restaurant

  geocoded_by :pickup

  after_validation :calculate_pollution
  after_validation :geocode

  # Calculate pollution each customer emitted if they were to hitch on a deliver
  # WIP : change 100 to pollution index
  def each_pollution
    if orders.count.zero?
      self.total_pollution
    else
      total_pollution / orders.count
    end
  end

  def ors_coordinates
    [longitude, latitude]
  end

  private

  def calculate_pollution
    travel_distance = calculate_travel_distance('driving-car')

    # WIP : Average grams of carbon emitted per kilometer is 250g
    pollution = travel_distance * 250 / 1000
    update_attribute(:total_pollution, pollution)
  end

  def calculate_travel_distance(mode_of_transport)
    travel_distance = OpenRoutesService.get_travel_distance(mode_of_transport, restaurant.ors_coordinates, [longitude, latitude])
    update_attribute(:travel_distance, travel_distance)
    return travel_distance
  end
end
