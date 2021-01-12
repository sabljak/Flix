class Movie < ApplicationRecord
    def flop?
        total_gross < 225000000 || total_gross.blank?
    end
end
