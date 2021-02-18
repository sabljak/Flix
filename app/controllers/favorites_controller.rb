class FavoritesController < ApplicationController
  before_action :require_signin
  before_action :set_movie
  def create
    @movie.fans << Current.user

    redirect_to @movie
  end

  def destroy
    favorite = Current.user.favorites.find(params[:id])
    favorite.destroy

    redirect_to @movie
  end
  private
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end
