require_relative('../db/sql_runner')

class Film

    attr_reader :id, :name, :genre, :running_time

    def initialize(options)
        @id = options['id'].to_i
        @name = options['name']
        @genre = options['genre']
        @running_time = options['running_time'].to_i
    end

end