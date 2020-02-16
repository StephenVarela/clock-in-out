require 'rails_helper'
require 'byebug'

RSpec.describe :time_card, type: :model do           
  describe '.valid?' do
    context 'time out is before time in' do 
      let(:user) { FactoryBot.create(:user) }
      let(:time_card) { FactoryBot.build(:time_card, user: user, time_in: Time.now, time_out: 5.minutes.ago) }
      
      it 'is not valid' do 
        expect(time_card).to be_invalid
      end
    end
  end
end