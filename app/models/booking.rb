class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def set_total_price
    self.price = room.price
    total_days = (ends_at.to_date - starts_at.to_date).to_i
    self.total = price * total_days
  end
end
