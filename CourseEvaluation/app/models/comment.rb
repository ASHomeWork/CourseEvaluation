class Comment < ApplicationRecord
    belongs_to :user
    has_many :reviews
    belongs_to :course
    has_many :likes, through: :users,dependent: :destroy 
    
    def get_reviews
        review=Review.where(:comment => self)
    end
end
