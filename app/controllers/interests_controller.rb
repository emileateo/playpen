class InterestsController < ApplicationController
  def index
    @interests = Interest.all
    @pets = Pet.where(user: current_user)
    # @current_user_interests = Interest.where(pet: current_user)
    # I want to find all the interests that User A (Current User) received
    # HELPPPPP
    @current_user_interests = []
    @interests.all.each do |interest|
      if @pets.include? interest.pet
        @current_user_interests << interest
      end
    end
  end

  def create
    @interest = Interest.new(interest_params)
    @pet = Pet.find(params[:pet_id])
    @interest.pet = @pet
    # This pet is the pet who receives the request
    @interest.user = current_user
    # This user is the user who sends the request

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
