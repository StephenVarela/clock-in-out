class TimeCard < ApplicationRecord
  belongs_to :user
  before_save :calculate_total_time

  def time_in_hours
    total_time.nil? ? 0 : total_time / 60.0 / 60.0  
  end
  
  def calculate_total_time
    return if time_out.nil?

    self.total_time = time_out - time_in
  end
end
