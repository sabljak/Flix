class AddReviewsCountToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :reviews_count, :integer
  end
end
