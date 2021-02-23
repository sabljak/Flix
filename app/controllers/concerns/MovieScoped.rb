module MovieScoped
  extend ActiveSupport::Concern

  included  do
    before_action :set_movie
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end
end