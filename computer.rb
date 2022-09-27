class CodeBreaker
    include Display 
  
    def initialize
      @guesses = 0
      @guess = nil
      @possible_guesses = ["1", "2", "3", "4"].repeated_permutation(4).to_a
      @A = 0
      @B = 0
      @previous_score = 0
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
      i = 0
      while @guesses < 12
        if (@A + @B) == 4
          @guess.shuffle! until @maker_code == @guess || @guesses == 12
        else
          @guess = @possible_guesses[i]  if i < @possible_guesses.length()
          i += 1
        end
        @guesses += 1
        print "\nComputer's Guess: #{@guess}"
        print "\nTurn: #{@guesses}"
        feedback(@maker_code, @guess)
        break if @A == 4
      end
      play_again?
    end
    
    def feedback(code, guess)
      @previous_score = @A + @B
      @A = 0
      @B = 0
      code.each_with_index do |item, index|
        if code[index] == guess[index]
          @A += 1
        elsif guess.include?(code[index])
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
  
    def play_again?
      puts "\nEnter 'y' to play again."
      input = gets.chomp
      if input.downcase == 'y'
        Game.new.play 
      else
        print "Thanks for playing!"
      end
    end
  
  end