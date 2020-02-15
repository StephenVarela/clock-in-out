
class TimeCardsController < ApplicationController
  before_action :authorize, only: %i[index show new edit create update destroy]

  def index
    @time_cards = TimeCard.all
  end

  def show
    @time_card = TimeCard.find_by(id: params[:id])
  end

  def new
    @time_card = TimeCard.new
  end

  def edit
    @time_card = TimeCard.find_by(id: params[:id])
  end

  def create
    @time_card = TimeCard.new(time_card_params)
    @time_card.user = current_user

    respond_to do |format|
      if @time_card.save
        format.html { redirect_to '/', notice: "TimeCard was successfully created. Time In: #{@time_card.time_in}" }
        format.json { render :show, status: :created, location: @time_card }
      else
        format.html { render :new }
        format.json { render json: @time_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @time_card = TimeCard.find_by(id: params[:id])
    respond_to do |format|
      if @time_card.update(time_card_params)
        format.html { redirect_to '/', notice: "TimeCard was successfully updated. Time Out: #{@time_card.time_in}" }
        format.json { render :show, status: :ok, location: @time_card }
      else
        format.html { render :edit }
        format.json { render json: @time_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @time_card = TimeCard.find_by(id: params[:id])
    @time_card.destroy
    respond_to do |format|
      format.html { redirect_to time_cards_url, notice: 'TimeCard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def time_card_params
      params.require(:time_card).permit(:time_in, :time_out)
    end
end
