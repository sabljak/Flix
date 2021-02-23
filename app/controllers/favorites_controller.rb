class FavoritesController < ApplicationController
  include MovieScoped
  before_action :require_signin

  def create
    Current.user.favorite_movies << @movie

    redirect_to @movie
  end

  def destroy
    favorite = Current.user.favorites.find(params[:id])
    favorite.destroy

    redirect_to @movie
  end
end
