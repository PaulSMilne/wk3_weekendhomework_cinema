require_relative('../db/sql_runner')

class Film

    attr_reader :id, :name, :genre, :running_time

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @genre = options['genre']
        @running_time = options['running_time'].to_i
    end

    def create
        sql = "INSERT INTO films (name, genre, running_time) VALUES (
            name            = '#{name}',
            genre           = '#{genre}',
            running_time    = '#{running_time}')
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
            name = '#{@name}',
            genre = '#{@genre}',
            running_time = '#{@running_time}') 
        WHERE id = #{@id};"
        SqlRunner.run(sql)
    end

    def delete
        sql = "DELETE FROM films WHERE id = #{@id}"
        SqlRunner.run(sql)
    end

end