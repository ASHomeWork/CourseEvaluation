class Major < ApplicationRecord
    has_many :courses
    belongs_to :college
end
