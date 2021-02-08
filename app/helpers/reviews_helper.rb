module ReviewsHelper

    def review_count(movie)
        pluralize(movie.reviews.size, 'review')
    end
end
