class Flight < ApplicationRecord
  belongs_to :aeroplane
  has_many :seats , dependent: :destroy

  validates :origin, presence: true, allow_blank: false
  validates :dist, presence: true, allow_blank: false
  validates :origin, uniqueness: { scope: :dist }
  
end
