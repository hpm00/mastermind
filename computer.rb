class CodeBreaker
    include Display 
  
    def initialize
      @guesses = 0
      @guess = nil
      @possible_guesses = ["1", "2", "3", "4"].repeated_permutation(4).to_a
      @A = 0
      @B = 0
    end 
    
    def play
      get_maker_code
      make_guess
    end
  
    def get_maker_code
      puts "\nEnter your code."
      code = gets.chomp
      @maker_code = code.split(//)
      return @maker_code if code.match?(/^[1-4][1-4][1-4][1-4]$/)
  
      puts "Invalid Selection."
      get_maker_code
    end
  
    def make_guess
      while @guesses < 12
        if (@A + @B) == 4
          @guess.shuffle!
        else
          @guess = @possible_guesses.sample
        end
        @guesses += 1
        print "\nComputer's Guess: #{@guess}"
        print "\nTurn: #{@guesses}"
        feedback(@maker_code, @guess)
        break if @A == 4
      end
      game_over
      play_again?
    end
  
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
  
    def remove_digit(digit)
      @possible_guesses.each_with_index do |item, index|
        @possible_guesses.delete_if { |item| item[index] == digit }
      end
    end
end