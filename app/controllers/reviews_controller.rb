class ReviewsController < ApplicationController
  include MovieScoped
  before_action :require_signin

  def index
    @reviews = Movie.includes(:reviews).find(params[:movie_id]).reviews.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html
      format.json {
        render json: { entries: render_to_string(partial: "reviews", formats: [:html]), pagination: view_context.will_paginate(@reviews) }
      }
    end
  end

  def create
    @review = @movie.reviews.new(review_params)

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

  def review_params
    params.require(:review).permit(:stars, :comment)
  end
end
