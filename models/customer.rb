require_relative('../db/sql_runner')
# require_relative('ticket.rb')

class Customer

    attr_reader :id
    attr_accessor :name, :wallet

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @wallet = options['wallet'].to_i
    end

    def create
        sql ="INSERT INTO customers (name, wallet) VALUES ('#{@name}', '#{@wallet}') RETURNING *"
        customer = SqlRunner.run(sql).first
        @id = customer['id']
    end

    def self.read_all
        sql = "SELECT * FROM customers"
        all_customers = SqlRunner.run(sql).map {|customer| Customer.new(customer)}
        return all_customers
    end

    def update
        sql = "UPDATE customers SET 
            name        = '#{@name}',
            wallet      = '#{@wallet}'
        WHERE id = #{@id};"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM customers WHERE id = #{@id}"
        SqlRunner.run(sql)
    end

    def self.delete_all
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end

    # def buy_ticket(film_name, new_price) 
        #CHECK OUT MAPPING FUNCTIONS FROM OTHER EXERCISES
        # sql_film_id ="SELECT id FROM films WHERE name = '#{film_name}'"
        # new_film_id = SqlRunner.run(sql_film_id).first
        # new_ticket = Ticket.new('customer_id' => @id, 'film_id' => new_film_id, 'price' => new_price)
        # @wallet -= new_price

        # return new_ticket
    # end
end