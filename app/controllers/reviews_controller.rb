class ReviewsController < ApplicationController
  before_action :require_signin
  before_action :set_movie

  def index
    @review = @movie.reviews
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      flash.now[:notice] = 'Review successfully created!'
    end
  end

  def edit
    @review = @movie.reviews.find(params[:id])
  end

  def update
    @review = @movie.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie), notice: "Review successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @review = @movie.reviews.find(params[:id])
    @review.destroy

    redirect_to movie_reviews_url(@movie), alert: "Review successfully deleted!"
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:stars, :comment)
  end
end
