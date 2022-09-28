require_relative './display.rb'
require_relative './computer.rb'
require_relative './human.rb'

class Game
  include Display

  def play
    puts game_intro
    puts game_instructions
    puts game_clues
    puts game_mode
    mode = game_mode_selection
    code_maker if mode == '1'
    code_breaker if mode == '2'
  end

  def game_mode_selection
    selection = gets.chomp
    return selection if selection.match?(/^[1-2]$/)

    puts "\nInvalid selection."
    game_mode_selection
  end

  def code_maker;
    CodeBreaker.new.play
  end

  def code_breaker
    CodeMaker.new.play
  end
end

