require_relative('../db/sql_runner')

class Ticket

    attr_reader :id
    attr_accessor :customer_id, :film_id, :price, :time, :capacity

    def initialize(options)
        @id = options['id'].to_i
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
        @price = options['price'].to_i
        @time = options['time']
        @capacity = options['capacity']  
    end

    def create
        sql = "INSERT INTO tickets (customer_id, film_id, price, time, capacity) VALUES ('#{@customer_id}', '#{@film_id}', '#{@price}', '#{@time}', '#{@capacity}') RETURNING *;"
        ticket = SqlRunner.run(sql)
        @id = ticket[id]
    end

    def self.read_all
        sql = "SELECT * FROM tickets"
        all_tickets = SqlRunner.run(sql).map {|ticket| Ticket.new(ticket)}
        return all_tickets
    end

    def update
        sql ="UPDATE tickets SET 
            customer_id = '#{@customer_id}',
            film_id = '#{@film_id}',
            price = '#{@price}',
            time = '#{@time}',
            capacity = '#{@capacity}'
        WHERE id = #{@id};"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM tickets WHERE id = #{@id};"
        SqlRunner.run(sql)
    end
    def self.delete_all
        sql = "DELETE FROM tickets"
        SqlRunner.run(sql)
    end
end
