require_relative('../db/sql_runner')

class Ticket

    attr_reader :id
    attr_accessor :customer_id, :film_id, :price

    def initialize(options)
        @id = options['id'].to_i
        @customer_id = options['customer_id'].to_i
        @film_id = options['film_id'].to_i
        @price = options['price'].to_i  
    end

    def create
        sql = "INSERT INTO tickets (customer_id, film_id, price) VALUES ('#{@customer_id}', '#{@film_id}', '#{@price}') RETURNING *;"
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
            price = '#{@price}'
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

    def self.sell(new_customer_id, new_film_id, new_price)
        new_ticket = Ticket.new('customer_id' => new_customer_id, 'film_id' => new_film_id, 'price' => new_price
            )
        new_ticket.create
        sql = "SELECT wallet FROM customers WHERE id = #{new_customer_id} "
        new_wallet = SqlRunner.run(sql).first["wallet"].to_i
        new_wallet -= new_price
        sql2 = "UPDATE customers SET wallet = #{new_wallet} WHERE id = #{new_customer_id} "
        SqlRunner.run(sql2)
    end

end
