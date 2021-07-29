class MenuItemController < ApplicationController
  def create
    begin
      menu_item = MenuItem.find(params[:id])
      menu_item.update(
        menu_item_params
      )
    rescue => e
      menu_item = MenuItem.create(
        menu_item_params
      )
    end
    render json: {menu_item: menu_item}, status: 200
  end

  private
  def menu_item_params
    params.require(:menu_item).permit(:id, :restaurant_id, :name, :price).select { |k,v| !v.blank?}
  end
end