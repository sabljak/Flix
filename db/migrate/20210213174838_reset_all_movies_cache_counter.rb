class ResetAllMoviesCacheCounter < ActiveRecord::Migration[6.0]
  def up
    Movie.all.each { |movie| Movie.reset_counters(movie.id, :reviews) }
  end

  def down

  end
end
