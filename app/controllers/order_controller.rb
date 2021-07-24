# frozen_string_literal: true

class OrderController < ApplicationController
  require 'json'

  # Create new order
  def create
    json = JSON.parse(request.body.read)
    new_order = Order.create(user_id: json["user_id"])
    
    orders = json['order']
    hitch_id = json['hitch_id']
    new_order.update(hitch_id: hitch_id)
    
    total_price = 0
    orders.each do |o|
      menu_item = MenuItem.find(o['menu_item_id'])
      quantity = o['quantity']
      oi = OrderItem.create(order_id: new_order.id, quantity: quantity, menu_item_id: menu_item.id)

      raise Errors::OrderItemCreationError unless oi.errors.empty?

      total_price += quantity * menu_item.price
    end
    new_order.update(total_price: total_price)

    pollution = new_order.hitch.each_pollution
    Order.where(hitch_id: new_order.hitch_id).update_all(pollution: pollution)

    return_order = Order.find_by(id: new_order.id)
    render json: { order: return_order }, status: 200
  end
end
