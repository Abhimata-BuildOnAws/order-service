class MenuItemController < ApplicationController
  def create
    menu_item = MenuItem.find(params[:id])
    if menu_item.exists?
      menu_item.update(
        restaurant_id: params[:restaurant_id], 
        name: params[:name], 
        price: params[:price]
      )
    else
      menu_item = MenuItem.create(
        id: params[:id],
        restaurant_id: params[:restaurant_id], 
        name: params[:name], 
        price: params[:price]
      )
    end
    render json: {menu_item: menu_item}, status: 200
  end
end