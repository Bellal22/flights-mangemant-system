class Aeroplane < ApplicationRecord
    has_many :categories , dependent: :destroy
    has_many :flights
    
    validates :model, presence: true, allow_blank: false , uniqueness: true
    validates :seats_no, presence: true, allow_blank: false
end
