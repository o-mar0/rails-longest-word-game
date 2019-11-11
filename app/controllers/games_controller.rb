# frozen_string_literal: true

# games controller
class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(rand(3..9))
    @start_time = Time.now
  end

  def score
    @end_time = Time.now
    @time_taken = @start_time - @end_time
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
