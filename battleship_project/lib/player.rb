class Player

    def get_move

        begin
        p 'enter a position with coordinates separated with a space like `4 7`'
        
        input = gets.chomp
        
            raise "please re-input your move" if input.split.length != 2
        rescue
            retry
        end

        move = input.split(" ")
        move.map! {|ele| ele.to_i}
    end

end
