# movie preview
class MoviesController < ApplicationController
  def preview
    @movie = Movie.find(params[:id])
    @review = Review.new
  end
end
