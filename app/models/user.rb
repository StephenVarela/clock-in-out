class User < ApplicationRecord
  has_secure_password
  has_many :time_cards, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def total_clocked_hours
    total_time = 0
    
    time_cards.where('total_time IS NOT NULL').each do |time_card|
      total_time = total_time + time_card.total_time
    end

    total_time / 60.0 / 60.0
  end
end
