require 'pry'
require 'yaml'


module Hangman

  class SecretWord
#
  attr_accessor :get_word ,:correct, :incorrect, :lives, :set_pass,  :load_word, :word, :feedback

    def initialize
      @correct = []
      @incorrect = []
      @word = ""
      @word.length.times { @correct << "-" }
      @lives = 8
      get_word
      @yays =  ["Hooray!", "Alright!", "Super!", "Nice!", "Fantastic!", "Good going!", "Great!",\
 "Magnificent!", "Hey!", "Oh!", "Wow!"]
      @curses = ["Gee whiz!", "Well I'll be...", "Curses!", "Fiddlesticks!",\
 "Phooey.","Bah-humbug!"]
    end

    def correct_guess?(guess)
      @word.include?(guess)
    end

    def handle_correct(guess)
      guessed_correctly(guess)
      puts "That's correct!"
      random_yay = @yays[rand(0..@yays.length - 1)]
      puts "" "#{random_yay}"
      feedback
    end

    def guessed_correctly(guess)
      @correct.each_with_index do |e, i|
        if guess == @word[i]
          @correct[i] = @word[i]
        end
      end
end


    def handle_incorrect(guess)
      @incorrect << guess
      puts "That's incorrect."
      random_boo = @curses[rand(0..@curses.length - 1)]
      puts "" "#{random_boo}"
      feedback
    end

    def feedback
      puts "\nProgress: #{@correct.join("")}\nIncorrect guesses: #{@incorrect.join("-")}\nYou have #{ @lives - @incorrect.length } incorrect guesses remaining."
    end


    def pick_random_line
  word = File.readlines("/home/helen/Desktop/Helen Rubymine project/Ruby_Hangman_3/5desk.txt").sample
end

def get_word?(string)
  string.length > 4 && string.length < 12
end

def get_word
  fname = ("/home/helen/Desktop/Helen Rubymine project/Ruby_Hangman_3/5desk.txt")
 @word = ""
  until get_word?(@word)
    @word = pick_random_line.chomp.downcase
  end
end
  end
  end
