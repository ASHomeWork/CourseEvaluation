class Course < ApplicationRecord
    belongs_to :major
    belongs_to :teacher
end
