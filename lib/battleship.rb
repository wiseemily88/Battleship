# this will be the runner file
require './lib/game'
require './lib/messages'


include Messages

  greeter
  prompt_user_selection = gets.chomp
  new_game = Game.new(prompt_user_selection)
