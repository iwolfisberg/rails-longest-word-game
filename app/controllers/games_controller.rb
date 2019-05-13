require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    alphabet = %w[A B C D E F J H I J K L M N O P Q R S T U V W X Y Z]
    10.times do
      @letters << alphabet.sample
    end
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    session[:score] = 0

    if word_check?(@word.upcase, @letters)
      if english_word?(@word)
        @sentence = "Congratulations ! #{@word.upcase} is a valid English word!"
        session[:score] += @word.length
      else
        @sentence = "Sorry but #{@word.upcase { |n| }} does not seem to be an English word"
      end
    else
      @sentence = "Sorry but #{@word.upcase} can't be build out of #{@letters}"
    end
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def word_check?(word, grid)
    word.upcase.chars.all? { |l| word.count(l) <= grid.count(l) }
  end
end
