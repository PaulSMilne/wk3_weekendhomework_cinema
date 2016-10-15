require_relative('../db/sql_runner')

class Film

    attr_reader :id, :name, :genre, :running_time

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
        sql = "UPDATE films SET (
            name = '#{@name}') 
        WHERE id = #{@id};"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM films WHERE id = #{@id}"
        SqlRunner.run(sql)
    end

    def delete_all
        sql = "DELETE FROM films"
        SqlRunner.run(sql)
    end
end