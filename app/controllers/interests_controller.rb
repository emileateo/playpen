class InterestsController < ApplicationController
  def index
  end

  def create
    @pet = Pet.find(params[:id])

    @interest = Interest.new(interest_params)
    @interest.pet = @pet

    @interest.status = false
  end

  private

  def interest_params
    params.require(:interest).permit(:message, :when, :venue)
  end
end
