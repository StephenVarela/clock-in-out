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
  end
end