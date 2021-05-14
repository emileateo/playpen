class PagesController < ApplicationController
  def home
    @pets = Pet.all

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
  end
end
