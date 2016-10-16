require_relative('models/ticket.rb')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require('pry-byebug')

Ticket.delete_all
Film.delete_all
Customer.delete_all

customer1 = Customer.new('name' => "Kyle", 'wallet' => 25)
customer1.create
customer2 = Customer.new('name' => "Diana", 'wallet' => 15)
customer2.create
customer3 = Customer.new('name' => "Ross", 'wallet' => 10)
customer3.create
customer4 = Customer.new('name' => "Kate", 'wallet' => 20)
customer4.create
customer5 = Customer.new('name' => "Thomas", 'wallet' => 12)
customer5.create
customer6 = Customer.new('name' => "Jo", 'wallet' => 9)
customer6.create

customer7 = Customer.new('name' => "Zsolt", 'wallet' => 50)
customer7.create

film1 = Film.new('name' => "Singin'' in the Rain")
film1.create
film2 = Film.new('name' => "The Big Short")
film2.create
film3 = Film.new('name' => "Plan 9 from Outer Space")
film3.create

Ticket.sell(customer1.id, film1.id, 4)
Ticket.sell(customer4.id, film1.id, 4)
Ticket.sell(customer5.id, film1.id, 4)
Ticket.sell(customer7.id, film1.id, 4)
Ticket.sell(customer1.id, film2.id, 6)
Ticket.sell(customer2.id, film2.id, 6)
Ticket.sell(customer3.id, film2.id, 6)
Ticket.sell(customer6.id, film2.id, 6)
Ticket.sell(customer7.id, film2.id, 6)
Ticket.sell(customer7.id, film3.id, 2)





binding.pry
nil