class Building < ApplicationRecord
    belongs_to :customer
    has_many :intervention

end
