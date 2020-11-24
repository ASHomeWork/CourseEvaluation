class College < ApplicationRecord
    has_many :majors
    has_many :teachers
end
