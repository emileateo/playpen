class PagesController < ApplicationController
  def home
    @pets = Pet.all

    @search = params["search"]

    if @search.present?
      @breed = @search["breed"]
      @pets = Pet.search_by_breed(@breed)
    end

    @max_dist = params["location"]
    @coords = session[:coords].transform_values(&:to_f)

    if @max_dist.present?
      @pets = Pet.near([@coords["lat"], @coords["lng"]], @max_dist["max distance away"].to_f)
    end

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude
      }
    end
  end
end
