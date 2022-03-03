
class Board
    attr_reader :grid_size

    def initialize(n=3)
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

        if (arr.first < @grid.length && arr.last < @grid.length) && (arr.first > -1 && arr.last > -1)
            return true
        else
            return false
        end

    end


    def empty?(position)


        @grid[position.first][position.last] == "_"
    end
    def place_mark(position,mark)

        if valid?(position) 
            if empty?(position)
                self[position] = mark
            else

                raise "The position: " + position.to_s + " is not empty"
            end
        else
            raise "The position: " + position.to_s + " is not valid"
        end
    end

    def print_board

        @grid.each do |arr|


            arr.each do |ele|
                print ele 
                print " "
            end
            puts
        end
        puts
    end

    def win_row?(mark)

        @grid.any? do |array|

            array.all? {|ele| ele == mark}
        end
            
    end

    def win_column?(mark)
        transpose_grid = Array.new(@grid.length) {Array.new(@grid.length)}
        i = 0 
        while i < transpose_grid.length
            j = 0
            while j < transpose_grid.length
                transpose_grid[j][i] = @grid[i][j]
            j +=1
            end
            i+=1
        end
        

        transpose_grid.any? do |array|

            array.all? {|ele| ele == mark}
        end
    end

    def transpose_grid

        transpose_grid = Array.new(@grid.length) {Array.new(@grid.length)}
        i = 0 
        while i < transpose_grid.length
            j = 0
            while j < transpose_grid.length
                transpose_grid[j][i] = @grid[i][j]
            j +=1
            end
            i+=1
        end
    end

    def win_diagonal?(mark)
        win = true
        #front diagonal
        i = 0 
        while i < @grid.length
            j = 0
            while j < @grid.length
                if j == i

                    return false if (mark != @grid[j][i]) 
                    win = (mark == @grid[j][i])
                end
                j += 1
            end
            i += 1
        end

        return win unless false

        

    end

end

if false
  
    load '/home/chuck/App_academy/W2D3/TicTacToe/v1/board.rb'
    b = Board.new
    
    b.place_mark([-1, 2], :X) # this should fail

    
    
    b.place_mark([1, 2], :X)
    
    b
    
    b.place_mark([1, 3], :X) # this should fail
    
    
    b.place_mark([0, 0], :O)
    
    b
    
    b.place_mark([0, 0], :X) # this should fail
    
    b.print_board

    b.place_mark([1,0],:X)
    b.place_mark([1,1],:X)
    
    b.print_board
 
    puts b.win_row?(:X)

    load '/home/chuck/App_academy/W2D3/TicTacToe/v1/board.rb'
    c = Board.new
    c.place_mark([0,0],:X)
    c.place_mark([1,0],:X)
    c.place_mark([2,2],:X)
    c.win_diagonal?(:X)

    puts

end