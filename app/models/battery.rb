class Battery < ApplicationRecord
    belongs_to :building
    has_many :column
    has_many :intervention
end
