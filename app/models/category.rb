class Category < ApplicationRecord
    belongs_to :aeroplane
    has_many :seats , dependent: :destroy
end
