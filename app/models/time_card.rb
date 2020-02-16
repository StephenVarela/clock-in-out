class TimeCard < ApplicationRecord
  belongs_to :user
  before_save :calculate_total_time

  def calculate_total_time
    return if time_out.nil?

    self.total_time = time_out - time_in
  end
end
