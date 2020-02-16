require 'rails_helper'
require 'byebug'

RSpec.describe :user, type: :model do           
  context 'duplicate email' do
    describe '.valid?' do
      let!(:user) { FactoryBot.create(:user) }
      
      it 'is invalid' do
        user_new = FactoryBot.build(:user)
        
        expect(user_new).to be_invalid
      end
    end

    describe '.destroy' do
      let(:timecards) { FactoryBot.build_list(:time_card, 10) }
      let!(:user) { FactoryBot.create(:user, time_cards: timecards) }
      
      it 'destroys all timecards associated with the user' do
        expect{ user.destroy! }.to change { TimeCard.count }
          .by(-10)
      end
    end

    describe '.total_clocked_hours' do 
      let(:timecards) { FactoryBot.build_list(:time_card, 10) }
      let!(:user) { FactoryBot.create(:user, time_cards: timecards) }

      it 'calculates total time' do
        expected_value = (user.time_cards.first.total_time * 10) / 60.0 / 60.0
        
        expect(user.total_clocked_hours).to eq(expected_value)
      end
    end
  end
end