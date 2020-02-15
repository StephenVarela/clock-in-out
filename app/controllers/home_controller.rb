class HomeController < ApplicationController
  def index
    if current_user.present?
      time_card = current_user.time_cards&.last

      if time_card.nil?
        @time_card = TimeCard.new
      elsif time_card.time_out.nil?
        @time_card = time_card
      else
        @time_card = TimeCard.new
      end

      @time_cards = current_user.time_cards
    end 
  end
end
