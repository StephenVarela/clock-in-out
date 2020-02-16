class TimeCard < ApplicationRecord
  belongs_to :user
  before_save :calculate_total_time
  validate :clock_in_less_than_clock_out 

  def time_in_hours
    total_time.nil? ? 0 : total_time / 60.0 / 60.0  
  end
  
  def calculate_total_time
    return if time_out.nil?

    self.total_time = time_out - time_in
  end

  def clock_in_less_than_clock_out
    if time_out.present?
      if time_in.to_i > time_out.to_i
        errors.add(:time_out, "can't be less than time in")
      end
    end
  end
end
