# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# res = Restaurant.create(email: 'aikarvin@gmail.com', name: 'Mise en Place', street: '12 Verde Avenue', state: 'Singapore', country: 'Singapore', contact_no: '12345678')
# food1 = MenuItem.create(name: 'Orange chicken', description: 'Its just orange chicken', price: 4.5, restaurant_id: res.id)
# food2 = MenuItem.create(name: 'Blue chicken', description: 'Its blue chicken', price: 5.5, restaurant_id: res.id)
res0 = Restaurant.create(id: 'e713f952-80f9-4f83-8175-55d438840035', name: 'Fortune Centre', street: '190 Middle Rd', state: 'Singapore', country: 'Singapore')
res1 = Restaurant.create(id: 'ca806b9e-253f-4019-b5d0-d25284d39e3f', name: 'Sunshine Plaza', street: '91 Bencoolen St', state: 'Singapore', country: 'Singapore')
res2 = Restaurant.create(id: 'b35bf756-1c43-4678-94c0-8b9520ab0be2', name: 'Bugis Junction', street: '200 Victoria St', state: 'Singapore', country: 'Singapore')
res3 = Restaurant.create(id: 'b2e7928c-89a9-43f7-8048-187ab025be12', name: 'Funan', street: '107 North Bridge Rd', state: 'Singapore', country: 'Singapore')
res4 = Restaurant.create(id: '814f2f12-10f8-4af9-af3d-ec1899ada268', name: 'Raffles City', street: '252 North Bridge Rd', state: 'Singapore', country: 'Singapore')

puts "#{Restaurant.count} restaurants seeded"

user0 = User.create(id: '627fae83-1313-45b6-9273-a53e74011b92')
user1 = User.create(id: '627fae83-1313-45b6-9273-a53e74011b92')
user2 = User.create(id: 'cb4e6947-46f7-4711-897b-fcd6a3360896')
user3 = User.create(id: '3e227619-993a-47e9-a87e-cd21d44589b2')


puts "#{User.count} users seeded"

users = [user0, user1, user2, user3]

res = [res0, res1, res2, res3, res4]

food00 = MenuItem.create(name: 'Red fish', id: 'd3ba111d-025f-414a-a778-81c3b87856c6', price: 3.5, restaurant_id: res0.id)
food01 = MenuItem.create(name: 'Orange chicken', id: '3d389f3c-fb7b-467b-9f27-657aa864f20f', price: 4.5, restaurant_id: res0.id)
food02 = MenuItem.create(name: 'Blue chicken', id: '7414d841-e22b-46da-8dc5-516a55eeb165', price: 5.5, restaurant_id: res0.id)
food03 = MenuItem.create(name: 'Yellow cod', id: 'a4ab07e1-ae44-449f-bbe0-d920214c5c5a', price: 4.5, restaurant_id: res0.id)
food04 = MenuItem.create(name: 'Pink panther', id: 'edb00b57-aa8a-41e0-a77d-32543b041dad', price: 6.5, restaurant_id: res0.id)

food10 = MenuItem.create(name: 'Red fish', id: 'a964c50c-e170-4217-821b-d960bd50f6ea', price: 3.5, restaurant_id: res1.id)
food11 = MenuItem.create(name: 'Orange chicken', id: 'e59b27b1-4100-486e-9a85-da1b650bf727', price: 4.5, restaurant_id: res1.id)
food12 = MenuItem.create(name: 'Blue chicken', id: '6585481c-fcd0-4c81-970a-518fa8c1ae0d', price: 5.5, restaurant_id: res1.id)
food13 = MenuItem.create(name: 'Yellow cod', id: 'ee8cebff-1336-4dc0-b84e-5877868ce575', price: 4.5, restaurant_id: res1.id)
food14 = MenuItem.create(name: 'Pink panther', id: '5d86cde3-4262-4661-8173-40da3cf72401', price: 6.5, restaurant_id: res1.id)

food20 = MenuItem.create(name: 'Red fish', id: 'a389a311-0394-4061-9d10-4d9ff235c102', price: 3.5, restaurant_id: res2.id)
food21 = MenuItem.create(name: 'Orange chicken', id: '2dc232e9-637a-43b7-b84b-ebb5bf4a8b9e', price: 4.5, restaurant_id: res2.id)
food22 = MenuItem.create(name: 'Blue chicken', id: 'fc891cf5-edac-401a-a473-2ef571d0c79b', price: 5.5, restaurant_id: res2.id)
food23 = MenuItem.create(name: 'Yellow cod', id: 'ef2f0ac9-d078-4302-9d80-7975c3e76a7a', price: 4.5, restaurant_id: res2.id)
food24 = MenuItem.create(name: 'Pink panther', id: '442e29e0-9baf-4623-bbfd-08e2617b4118', price: 6.5, restaurant_id: res2.id)
food25 = MenuItem.create(name: 'Beef Rendang', id: 'b2e7928c-89a9-43f7-8048-187ab025be12', price: 6.9, restaurant_id: res2.id)

food30 = MenuItem.create(name: 'Red fish', id: '2b66af08-cf0b-4238-9864-75051f990ab2', price: 3.5, restaurant_id: res3.id)
food31 = MenuItem.create(name: 'Orange chicken', id: '324141ff-7af0-415d-abd5-da65d761e6e9', price: 4.5, restaurant_id: res3.id)
food32 = MenuItem.create(name: 'Blue chicken', id: '4b69bff0-f1d1-406e-913f-378d88f22308', price: 5.5, restaurant_id: res3.id)
food33 = MenuItem.create(name: 'Yellow cod', id: 'dac1e3e3-177c-41c1-bedd-54f58b37d520', price: 4.5, restaurant_id: res3.id)
food34 = MenuItem.create(name: 'Pink panther', id: '57989db2-ce6f-4ec1-9b06-a7d4b3da832e', price: 6.5, restaurant_id: res3.id)

food40 = MenuItem.create(name: 'Red fish', id: 'f8626f94-e038-4143-85ca-17b1b1353244', price: 3.5, restaurant_id: res4.id)
food41 = MenuItem.create(name: 'Orange chicken', id: '566c7b96-0eff-4440-9ff0-0e2fde9833d6', price: 4.5, restaurant_id: res4.id)
food42 = MenuItem.create(name: 'Blue chicken', id: '5a309412-2139-48a6-a9c6-7e15c3b9dfcb', price: 5.5, restaurant_id: res4.id)
food43 = MenuItem.create(name: 'Yellow cod', id: 'f11289d1-691e-463b-9119-8de7b711cdec', price: 4.5, restaurant_id: res4.id)
food44 = MenuItem.create(name: 'Pink panther', id: 'ca532477-01b7-4067-b66e-60fb2d501530', price: 6.5, restaurant_id: res4.id)

puts "#{MenuItem.count} menu items seeded"

hitch0 = Hitch.create(pickup: '190 Middle Rd', user: user0, restaurant_id: res0.id, submit_time: DateTime.iso8601("2021-07-21T14:40:06+08:00"))
hitch1 = Hitch.create(pickup: '25 Bencoolen St', user: user1, restaurant_id: res1.id, submit_time: DateTime.iso8601("2021-07-21T14:40:06+08:00"))
hitch2 = Hitch.create(pickup: '13 Verde Ave', user: user2, restaurant_id: res2.id, submit_time: DateTime.iso8601("2021-07-21T14:40:06+08:00"))

puts "#{Hitch.count} hitches seeded"
# hitch3 = Hitch.create(pickup: '7 Orange Grove Rd')

order0 = Order.create(user: user0, hitch: hitch0)
OrderItem.create(order_id: order0.id, quantity: 1, menu_item_id: food00.id)
OrderItem.create(order_id: order0.id, quantity: 2, menu_item_id: food02.id)
OrderItem.create(order_id: order0.id, quantity: 2, menu_item_id: food03.id)

order1 = Order.create(user: user1, hitch: hitch1)

oi = OrderItem.create(order_id: order1.id, quantity: 1, menu_item_id: food10.id)

oi = OrderItem.create(order_id: order1.id, quantity: 2, menu_item_id: food14.id)
oi = OrderItem.create(order_id: order1.id, quantity: 2, menu_item_id: food13.id)


order2 = Order.create(user: user2, hitch: hitch0)
OrderItem.create(order_id: order2.id, quantity: 1, menu_item_id: food01.id)
OrderItem.create(order_id: order2.id, quantity: 3, menu_item_id: food04.id)

order3 = Order.create(user: user3, hitch: hitch2)
oi = OrderItem.create(order_id: order3.id, quantity: 1, menu_item_id: food20.id)
oi = OrderItem.create(order_id: order3.id, quantity: 2, menu_item_id: food22.id)
oi = OrderItem.create(order_id: order3.id, quantity: 2, menu_item_id: food23.id)


puts "#{Order.count} orders seeded"
puts "#{OrderItem.count} order items seeded"
