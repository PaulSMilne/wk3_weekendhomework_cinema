require_relative('../db/sql_runner')

class Customer

    attr_reader :id, :name, :wallet

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @wallet = options['wallet']
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
        sql = "UPDATE customers SET (
            name        = '#{@name}',
            wallet      = '#{@wallet}',)
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
end