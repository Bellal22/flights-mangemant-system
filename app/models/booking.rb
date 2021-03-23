class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :aeroplane
  belongs_to :seat
end
