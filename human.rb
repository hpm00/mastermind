class CodeMaker
    include Display 
  
    def initialize
      @random_code = ["1", "2", "3", "4"].repeated_permutation(4).to_a.sample
      puts "\nThe combination has been selected. Crack the combination in 12 or less tries."
      @guess = nil
      @guesses = 0
    end
  
    def play
      while @guesses < 12
        get_guess
        turns
        feedback(@random_code, @guess)
        break if @A == 4
      end
      game_over
      play_again?
    end
  
    def get_guess
      puts "\nEnter your guess."
      code = gets.chomp
      @guess = code.split(//)
      return @guess if code.match?(/^[1-4][1-4][1-4][1-4]$/)
      
      puts "Invalid Selection."
      get_guess
    end 
  
    def turns
      @guesses += 1
      puts "\nTurn: #{@guesses}"
      puts "Your Guess: #{@guess}"
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
        end
      end
      print "\nA:#{@A} B:#{@B}"
    end
end