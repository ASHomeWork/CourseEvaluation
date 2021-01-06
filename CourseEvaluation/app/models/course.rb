class Course < ApplicationRecord
    belongs_to :major
    belongs_to :teacher

    validates :name, presence: true
    validates :name, length: { minimum:2, maximum: 50}
    validates :name, uniqueness: { case_sensitive: false }
end
