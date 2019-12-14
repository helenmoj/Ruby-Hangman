require 'date'
require "yaml"

module Hangman
  class SaveGame
    attr_reader  :word_selected, :feedback, :save_game


    def initialize
    end

    def sanitize_load(user_input, saves)
      if user_input.to_i.to_s == user_input && user_input.to_i >= 0 && user_input.to_i <= saves.length
        return user_input.to_i
      else
        return :no_good
      end
    end

    def load_saved_game
       sleep(1)
      if File.exists?("../save") && Dir.glob("../save/*").length > 0
        saves = Dir.glob("../save/*")
        puts "", "Please enter a number:", "0. cancel"
        saves.each_with_index do |save, index|
          puts "#{index + 1}. #{File.basename(save).split(".")[0]}"
          end
        loop do
          user_input = gets.chomp
          user_input_san = sanitize_load(user_input, saves)
          if user_input_san == :no_good
            puts "Please enter a number corresponding to a saved game, or 0 to cancel and go back."
          elsif user_input_san == 0
return
          else
            yaml = File.read(saves[user_input_san - 1])
            game = YAML::load(yaml)
            puts "", "Game loaded!"
            game.start_game()
return
          end
        end
      else
        puts "", "No save game files found!"
      end
      end


def save_game
  yaml = YAML::dump(self)
  Dir.mkdir("../save") unless File.exists?("../save")
  File.open("../save/save_game_#{Time.now.strftime('%m-%d-%Y, %H:%M:%S')}.yaml", "w"){|f| f.puts yaml}
  puts "", "Game has been saved!", "Press enter to continue"
  gets
  end
  end
  end

