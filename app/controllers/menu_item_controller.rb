class MenuItemController < ApplicationController
  def create
    menu_item = MenuItem.create(restaurant_id: params[:restaurant_id], name: params[:name], price: params[:price])

    render json: {menu_item: menu_item}, status: 200
  end
end