require 'pry'
require "yaml"


require_relative '../../Helen Rubymine project/Ruby_Hangman_4/save_game.rb'
require_relative '../../Helen Rubymine project/Ruby_Hangman_4/password.rb'

module Hangman
  class Game
     attr_accessor :lives, :get_word, :guesses, :correct_guess,:word, :save_game, :load_saved_game, :correct


    def initialize # this means I can pass some arguments
      @secret_word = SecretWord.new
      @save_game = SaveGame.new
      @lives = 8
    end

     def feedback
       puts "\nProgress: #{@secret_word.correct.join("")}\nIncorrect guesses: #{@secret_word.incorrect.join("-")}\nYou have #{ @secret_word.lives - @secret_word.incorrect.length } incorrect guesses remaining."
     end


     def start_game
      puts "Play new game or load the saved game? "
      sleep(0.5)
      puts "(n) New game"
      puts "(l) Load game"
      sleep(0.5)
      n = gets.chomp.downcase
      if n == 'n'
        play_game
        l = gets.chomp.downcase
      else l == 'l'
      @save_game.load_saved_game
      end
      end

     def option_quit
       print '>>> Would you like to quit the game?(y/n)'
       sleep(0.5)
       q = gets.chomp.downcase
       q == 'y'
       if if q == 'y'
       puts "Thank you for playing!"
            abort
          end
       end
       end

     def play_game
      while true
        break if game_over?
        #get_word
        guess = get_guess
        option_quit
       unless guess == "save"
           @secret_word.correct_guess?(guess) ? @secret_word.handle_correct(guess) : @secret_word.handle_incorrect(guess)
       else
           @save_game.save_game if guess == "save"
         # sleep(0.5)
         # sleep(0.5)
         # sleep(0.5)
        end
    end
    end


def get_guess
  sleep(0.5)
  print "\nGive it a shot, guess a letter (or enter 'save' to save your progress) >> "
  gets.chomp.downcase
end

def game_over?
if @secret_word.correct.join("") == @secret_word.word
        puts "\nCongratulations the guess, #{@secret_word.word} is correct!"
   true
  elsif @secret_word.incorrect.length == @lives
   puts "\nYou did not guess the hidden word, bad luck this time... The correct answer is #{@secret_word.word}"
    true
  else
    false
  end
end
  end
     end
