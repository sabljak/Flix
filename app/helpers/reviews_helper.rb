module ReviewsHelper

    def review_count(movie)
        pluralize(movie.reviews_count, 'review')
    end
end
