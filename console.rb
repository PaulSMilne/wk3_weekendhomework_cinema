require_relative('models/ticket.rb')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require('pry-byebug')

# Ticket.delete_all
# Film.delete_all
# Customer.delete_all

customer1 = Customer.new("name" => "Paul", "wallet" => 25)
customer1.create

film1 = Film.new("name" => "The Long Goodbye")
film1.create

ticket1 = Ticket.new(
    "customer_id" => customer1.id, 
    "film_id" => film1.id, 
    "price" => 3, 
    "time" => 1830, 
    "capacity" => 200)
ticket1.create

binding.pry

nil