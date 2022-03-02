
class Board
    attr_reader :grid_size

    def initialize(n)
        @grid_size = 3
        @grid = Array.new(n) {Array.new(n)}

        @grid.map! do |sub_arr| 

            sub_arr.map! {'_'}


        end
    end

    def  [](arr)
        @grid[arr.first][arr.last]
    end

    def []=(position,value)

        @grid[position.first][position.last] = value
    end

    def valid?(arr)

        if arr.first < @grid_size && arr.last < @grid_size
            return true
        else
            return false
        end

    end


    def empty?(position)


        self[position] == "_"
    end
    def place_mark(position,mark)

        if !valid?(position) || !empty?(position)
            raise "The position: " + position.to_s + " is not valid"
        else
            self[position] = mark
        end
    end

end

b1 = Board.new(3)
puts b1.valid?([2,2])

puts b1.empty?([0,0])
puts "player 1"
b1.place_mark([0,0],"Morty")
puts b1.empty?([0,0])

puts "player 2"
b1.place_mark([0,0],"Rick")
puts "test if it got here"