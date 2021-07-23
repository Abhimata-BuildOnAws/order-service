class UserController < ApplicationController
  def create
    user = User.create(id: params[:user_id])
    render json: {user: user}, status: 200
  end
end