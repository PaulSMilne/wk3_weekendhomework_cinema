require_relative('../db/sql_runner')

class Ticket

    attr_reader :id, :customer_id, :film_id, :price, :concession_price, :time, :capacity

    def initialize(options)
        @id = options['id'].to_i
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
        @price = options['price'].to_i
        @concession_price = options['concession_price'].to_i
        @time = options['time']
        @capacity = options['capacity']  
    end

end
