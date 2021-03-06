class UsersController < ApplicationController
  before_action :authorize, only: %i[index show destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @time_cards = @user.time_cards
    @total_clocked_hours = @user.total_clocked_hours
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    message = 'Please Log In'
    
    if current_user.present?
      message = 'new user was created'
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', notice: message }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if current_user == @user
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'Updating other users is forbidden' }
        format.json { render :show, status: :forbidden }
      end
    end
  end

  def destroy
    if current_user == @user
      session[:user_id] = nil

      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'Deleting other users is forbidden' }
        format.json { render :show, status: :forbidden }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
