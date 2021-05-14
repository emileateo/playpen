class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @pets = Pet.where(user: current_user)
    @current_user_pet = []
    @pets.each do |pet|
      @current_user_pet << pet
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
