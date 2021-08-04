# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Health Check
  get '/tumpang/health_check', to: 'application#health_check'
  
  # Restaurant
  post '/restaurant/create', to: 'restaurant#create'

  # User
  post 'user/create', to: 'user#create'
  post 'tumpang/user_stats', to: 'user#user_stats'

  # MenuItem
  post 'menu_item/create', to: 'menu_item#create'

  # Order
  post 'order', to: 'order#create'
  get 'order/directions', to: 'order#directions'
  get 'order/distance', to: 'order#distance'
  post 'order/history', to: 'order#history'

  # Tumpang
  post '/tumpang', to: 'hitch#create'
  post '/tumpang/browse', to: 'hitch#get_all'
  post '/tumpang/nearby', to: 'hitch#nearby'
  post '/tumpang/nearby_hitches_for_restaurant', to: 'hitch#nearby_hitches_for_restaurant'
  post '/tumpang/add_order', to: 'hitch#add_order'
  post '/tumpang/history/month_range', to: 'hitch#history_by_month_range'

  # Emission
  post '/tumpang/emission_history', to: 'emission#emission_history' 
end
