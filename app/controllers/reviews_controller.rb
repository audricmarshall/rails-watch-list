# review controller
class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build(review_params)
    if @review.save
      redirect_to preview_movie_path(@movie), notice: "Review added!"
    else
      # on recharge la page preview avec les erreurs (valide pour simple_form)
      render 'movies/preview', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
