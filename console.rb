require_relative('models/ticket.rb')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require('pry-byebug')

Ticket.delete_all
Film.delete_all
Customer.delete_all

customer1 = Customer.new('name' => "Paul", 'wallet' => 25)
customer1.create
customer2 = Customer.new('name' => "Diana", 'wallet' => 15)
customer2.create

film1 = Film.new('name' => "The Long Goodbye")
film1.create
film2 = Film.new('name' => "Titanic")
film2.create

ticket1 = Ticket.new(
    'customer_id' => customer1.id, 
    'film_id' => film1.id, 
    'price' => 3)
ticket1.create

Ticket.sell(customer2.id, film2.id, 6)
Ticket.sell(customer1.id, film2.id, 6)
binding.pry


nil