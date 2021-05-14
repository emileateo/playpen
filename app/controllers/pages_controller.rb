class PagesController < ApplicationController
  def home
    @pets = Pet.all

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        image_url: helpers.asset_url('doggymarker.png')
      }
    end

    @search = params["search"]

    if @search.present?
      @breed = @search["breed"]
      @pets = Pet.search_by_breed(@breed)
    end

    @breed = Pet.select(:breed).distinct
  end

  def blogpost1
  end

  def blogpost2
  end
end
