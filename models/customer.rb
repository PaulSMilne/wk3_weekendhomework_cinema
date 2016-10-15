require_relative('../db/sql_runner')

class Customer

    attr_reader :id, :name, :wallet, :concession

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @wallet = options['wallet']
        @concession = options[false]
    end

    def create
        sql ="INSERT INTO customers (name, wallet, concession) VALUES ('#{@name}', '#{@wallet}', '#{@concession}') RETURNING *"
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
            wallet      = '#{@wallet}',
            concession  = '#{@concession}')
        WHERE id = #{@id};"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM customers WHERE id = #{@id}"
        SqlRunner.run(sql)
    end

    def delete_all
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end
end