class User < ApplicationRecord
    belongs_to :gender
    has_many :comments
    has_many :marks
end
