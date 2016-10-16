require_relative('../db/sql_runner')
require_relative('ticket.rb')

class Film

    attr_reader :id
    attr_accessor :name, :genre, :running_time

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
    end

    def create
        sql = "INSERT INTO films (name) VALUES ('#{@name}')
        RETURNING *;"
        film = SqlRunner.run(sql).first
        @id = film['id']
    end

    def self.read_all
        sql = "SELECT * FROM films"
        all_films = SqlRunner.run(sql).map {|film| Film.new(film)}
        return all_films
    end

    def update
        sql = "UPDATE films SET 
            name = '#{@name}' 
        WHERE id = #{@id};"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM films WHERE id = #{@id}"
        SqlRunner.run(sql)
    end

    def self.delete_all
        sql = "DELETE FROM films"
        SqlRunner.run(sql)
    end

    def customer_count
        sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE tickets.film_id = #{@id};"
        customers = SqlRunner.run(sql)
        return customers.count
    end

    def popular_time
        sql = "SELECT * FROM tickets WHERE film_id = #{@id};"
        tickets = SqlRunner.run(sql)
        ticket_times = tickets.map {|ticket| ticket["time"]}
        popular_time = ticket_times.uniq.max_by{|time| ticket_times.count[time.to_i]}
        return popular_time
    end
end