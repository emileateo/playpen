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
        @current_user_interests << interest if !interest.status
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
    redirect_to playdate_path
  end
  def playdates
    @pets = Pet.where(user: current_user)
    @confirmed = Interest.where(status: true)
    # @confirmed_by_you = []
    # @confirmed_by_other = []
    # @confirmed.all.each do |interest|
    #   if @pets.include? interest.pet
    #     @confirmed_by_you << interest
    #   elsif interest.user == current_user
    #     @confirmed_by_other << interest
    #   end
    # end
    @your_confirmed = []

    @confirmed.all.each do |interest|
      if @pets.include? interest.pet
        @your_confirmed << interest
      elsif interest.user == current_user
        @your_confirmed << interest
      end
    end
    @your_confirmed.sort_by! { |playdate| playdate.when }
  end
  private
  def interest_params
    params.require(:interest).permit(:message, :when, :venue)
  end
end
