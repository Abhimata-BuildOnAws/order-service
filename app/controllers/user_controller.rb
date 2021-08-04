class UserController < ApplicationController
  def create
    user = User.create(id: params[:user_id])
    render json: {user: user}, status: 200
  end

  def user_stats
    orders = Order.where(user_id: params[:user_id])
    hitches = Hitch.where(user_id: params[:user_id])
    render json: {
      number_of_tumpangs: hitches.count,
      number_of_deliviries: orders.count
    }, status: 200
  end
end