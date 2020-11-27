class Comment < ApplicationRecord
    belongs_to :user
    has_many :reviews
    belongs_to :course
end
