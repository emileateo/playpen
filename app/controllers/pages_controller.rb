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

    @tagbreed = Pet.select(:breed).distinct

  @max_dist = params["location"]["max distance away"]
  @coords = session[:coords].transform_values(&:to_f)

  if @max_dist.present?
    @pets = Pet.near([@coords["lat"], @coords["lng"]], @max_dist.to_f)
  end

  @markers = @pets.geocoded.map do |pet|
    {
      lat: pet.latitude,
      lng: pet.longitude
    }
  end

  def blogpost1
  end

  def blogpost2
  end
end
end
