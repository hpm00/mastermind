class GameLogic
    def feedback(code, guess)
        visited = Array.new(guess.length) { false }
    
        @A = 0
        @B = 0
    
        code.each_with_index do |item, index|
          if item == guess[index]
            @A += 1
            @B -= 1 if visited[index]
            visited[index] = true
          elsif guess.each_index.any? { |idx| guess[idx] == item && !visited[idx] && visited[idx] = true  }
            @B += 1
          elsif !code.include?(guess[index])
            remove_digit(guess[index])
          end
        end
        print "\nA:#{@A} B:#{@B}"
    end

    def play_again?
        puts "\nEnter 'y' to play again."
        input = gets.chomp
        if input.downcase == 'y'
          Game.new.play 
        else
          print "Thanks for playing!"
        end
    end

    def game_over
        print "\nThe combination was guessed!" if @A == 4 
        print "\nThe combination wasn't guessed!" if @A != 4 && @guesses == 12
    end
end