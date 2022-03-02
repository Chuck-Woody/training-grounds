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
            p 'you sunk my battleship!'  
            return true
       else
            self[pos_arr] = :X
            return false
       end
    end

    def place_random_ships

        #set 25% of the elements in grid to :S
     
        num_ship_elements = @size / 4
        
       
        placed_ships = 0
        i = 0 
        while num_ship_elements > placed_ships
            # puts "top of while loop!"
            if i == @grid.length # if we ever get unlucky enough to not assign enough ships in a given pass
                i = 0
            end
            j = 0 
            while j < @grid[0].length
               

                if  @grid[i][j] != :S && rand(0...10) >= 3 && placed_ships < num_ship_elements
                    @grid[i][j] = :S
                    # puts "----------------------------------------" + "on: " + i.to_s + "  " + "  "  + j.to_s
                    # print @grid
                    # puts "----------------------------------------" + "num ships placed is: " + placed_ships.to_s
                    # puts "ships required: " + num_ship_elements.to_s

                    placed_ships += 1
                    # print self.num_ships
                end
                j += 1
            end

            i += 1
        end

    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid.length) {Array.new(@grid.length)}

        hidden_grid = @grid.map do |arr|

            arr.map do |ele| 
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
        hidden_grid
    end

    def self.print_grid(arr)
        
        arr.each do |array|
            line_string = " "
            array.each do |ele|

                line_string += ele.to_s + " "

            end
            print line_string.strip
            print "\n"
        end
    end

    def cheat

        Board.print_grid( @grid)
    end

    def print
       Board.print_grid( hidden_ships_grid)
    end

end
