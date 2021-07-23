# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Restaurant
  post '/restaurant/create', to: 'restaurant#create'

  # User
  post 'user/create', to: 'user#create'

  # MenuItem
  post 'menu_item/create', to: 'menu_item#create'

  # Order
  post 'order', to: 'order#create'
  get 'order/directions', to: 'order#directions'
  get 'order/distance', to: 'order#distance'

  # Tumpang
  post '/tumpang', to: 'hitch#create'
  post '/tumpang/browse', to: 'hitch#get_all'
  post '/tumpang/add_order', to: 'hitch#add_order'
end
