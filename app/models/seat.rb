class Seat < ApplicationRecord
  belongs_to :flight
  belongs_to :category

  validates :price, presence: true, allow_blank: false
  validates :pnr, presence: true, allow_blank: false , uniqueness: true

  def create_unique_pnr
    begin
      uid = SecureRandom.hex(4)
    end while self.class.exists?(pnr: uid)
    self.pnr = uid

  end
  
end
