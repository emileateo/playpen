class PagesController < ApplicationController
  def home
    @pets = Pet.all

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end

    @search = params["search"]

    if @search.present?
      @breed = @search["breed"]
      @pets = Pet.search_by_breed(@breed)
    end
  end
end
