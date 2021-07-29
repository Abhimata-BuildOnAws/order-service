# frozen_string_literal: true
require 'rufus-scheduler'

class Hitch < ApplicationRecord
  has_many :orders
  belongs_to :user
  belongs_to :restaurant

  geocoded_by :pickup

  after_validation :geocode
  after_validation :calculate_pollution
  after_validation :schedule_submit
  

  # Calculate pollution each customer emitted if they were to hitch on a deliver
  def each_pollution
    if orders.count.zero?
      self.total_pollution
    else
      total_pollution / orders.count
    end
  end

  def tree_points
    ((each_pollution - 700) * -1).to_i
  end

  def ors_coordinates
    [longitude, latitude]
  end

  private
  def schedule_submit
    scheduler = Rufus::Scheduler.new

    scheduler.at submit_time do
      self.orders.each do |order|
        update_user_pollution(order.user.id, each_pollution)
        update_user_tree_points(order.user.id, tree_points)
      end
    end
  end

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

  def update_user_pollution(user_id, pollution)
    user_service_ip = ServiceDiscovery.user_service_ip
    # Public IP
    # order_service_ip = "172.31.18.200"
    url = "http://" + user_service_ip + ":3000/user/update_pollution"

    headers = { "Content-Type": "application/json; charset=utf-8" }

    conn = Faraday.new(
      url: url,
      headers: headers
    )

    values = {
      "user_id": user_id,
      "pollution": pollution
    }
    
    response = conn.post do |req|
      req.body = values.to_json
      puts req
    end

  end

  def update_user_tree_points(user_id, tree_points)
    user_service_ip = ServiceDiscovery.user_service_ip
    # Public IP
    # order_service_ip = "172.31.18.200"
    url = "http://" + user_service_ip + ":3000/user/update_pollution"

    headers = { "Content-Type": "application/json; charset=utf-8" }

    conn = Faraday.new(
      url: url,
      headers: headers
    )

    values = {
      "user_id": user_id,
      "tree_points": tree_points
    }
    
    response = conn.post do |req|
      req.body = values.to_json
      puts req
    end

  end
end
