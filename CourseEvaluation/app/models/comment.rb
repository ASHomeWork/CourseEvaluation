class Comment < ApplicationRecord
    belongs_to :user
    has_many :reviews
    belongs_to :course
    
    def get_reviews
        review=Review.where(:comment => self)
    end
end
