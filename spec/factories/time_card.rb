FactoryBot.define do
  factory :time_card do
    time_in { 5.minutes.ago }
    time_out { DateTime.now}
  end
end