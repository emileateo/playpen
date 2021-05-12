class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @interest = Interest.new
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render 'new'
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render 'edit'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :temperament, :breed, :photo)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
