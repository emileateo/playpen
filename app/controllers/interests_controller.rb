class InterestsController < ApplicationController
  def index
    @interests = Interest.all
  end

  def create
    @interest = Interest.new(interest_params)
    @pet = Pet.find(params[:pet_id])
    @interest.pet = @pet
    @interest.user = current_user

    @interest.status = false

    @interest.save

    redirect_to pet_path(@pet)
  end

  private

  def interest_params
    params.require(:interest).permit(:message, :when, :venue)
  end
end