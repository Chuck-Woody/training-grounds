class Board

attr_reader :size

    def initialize(n)

        @grid = Array.new(n) {Array.new(n)}

        @grid.map! do |arr|

            arr.map! {:N}
        end

        @size = n * n



    end

    def [](arr)


        @grid[arr.first][arr.last]
    end

    def []=(position,value)

        @grid[position.first][position.last] = value
    end

    def num_ships

        @grid.flatten.count {|ele| ele == :S}
    end

    def attack(pos_arr)

       if self[pos_arr] == :S
            self[pos_arr] = :H
            print "you sunk my battleship!"  
            return true
       else
            self[pos_arr] = :X
            return false
       end
    end

    def place_random_ships

        #set 25% of the elements in grid to :S
        num_ship_elements = @size / 4
        # puts "My method shows there should be"
        # puts num_ship_elements 
        # puts "ships!"
        placed_ships = 0
        i = 0 
        while num_ship_elements > placed_ships

            if i == @grid.length # if we ever get unlucky enough to not assign enough ships in a given pass
                i = 0
            end
            j = 0 
            while j < @grid[0].length
                arr = [i,j]

                if  @grid[i][j] != :S && rand(0...10) >= 2
                    @grid[i][j] = :S
                    placed_ships += 1
                    # print self.num_ships
                end
                j += 1
            end

            i += 1
        end

    end
end
