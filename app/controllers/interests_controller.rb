class InterestsController < ApplicationController
  def index
    @interests = Interest.all
    @current_user_interests = Interest.where(user: current_user)
  end

  def create
    @interest = Interest.new(interest_params)
    @pet = Pet.find(params[:pet_id])
    @interest.pet = @pet
    @interest.user = @pet.user

    @interest.status = false

    @interest.save

    redirect_to pet_path(@pet)
  end

  def approve
    @interest = Interest.find(params[:id])
    @interest.toggle(:status)
    @interest.save

    redirect_to interests_path
  end

  def playdates
    @playdates = Interest.where(user: current_user, status: true)
  end

  private

  def interest_params
    params.require(:interest).permit(:message, :when, :venue)
  end
end
