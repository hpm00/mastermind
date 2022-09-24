module Display
    def game_intro
      print "\n\tWelcome to Mastermind. Review the game instructions below."
    end
  
    def game_instructions
        puts <<-INSTRUCTIONS
        \n\nHow to play:
      \nIn this game, you will be playing against the computer. 
      You can decide to be the code-maker or the code-breaker.
  
      As Code-Maker:
      \nYou will create a 4-digit combination using numbers from 1 to 6.
      Here are some examples: 1234, 4444, 5432, 6111.
      As you can see, you can repeat numbers.
      The computer will have 12 turns to guess your unique combination.
  
      As Code-Breaker:
      \nYou'll have 12 turns to guess the computer's combination. 
      INSTRUCTIONS
    end
  
    def game_clues
      puts <<-CLUES
      \n\nClues:
      \nFor each turn, feedback will be given to the code-breaker.
      Feedback will be given in this form: []:A  []:B
      A correct digit & position will increase A by 1.
      A correct digit & wrong position will increase B by 1.
      \nFor example: 
      Code-maker's combination: 1562
      \nCode-breaker's guess: 1231
      Feedback: [1]:A  [1]:B
      \nHere, the 1 in front of A represents a correct digit in the correct position. 
      The 1 in front of B represents a correct digit but in the wrong position.
      The feedback doesn't tell which digits were correctly guessed or in the correct position.
      \nFor example, if the next guess was: 3112
      The feedback will still be [1]:A [1]:B
      CLUES
    end
  
    def game_mode
      print "\nPress '1' to be code-maker."
      print "\nPress '2' to be code-breaker."
    end
end