class User < ApplicationRecord
    has_secure_password
    belongs_to :gender
    has_many :comments
    has_many :marks
end
