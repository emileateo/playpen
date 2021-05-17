class PagesController < ApplicationController
  def home
    @pets = Pet.all

    @tagbreed = Pet.select(:breed).distinct

    # @search = params["search"]

    # if @search.present?
    #   @coords = session[:coords].transform_values(&:to_f)
    #   @pets = Pet.search_by_breed(@search).near([@coords["lat"], @coords["lng"]], 3000.to_f)
    # end

    if session[:coords].present?
      @coords = session[:coords].transform_values(&:to_f)
    end

    # @max_dist = params["location"]
    # if @max_dist.present?
    #   @pets = Pet.near([@coords["lat"], @coords["lng"]], @max_dist["max distance away (KM)"].to_f)
    # end

    @breed = params["breed"]
    @max_dist = params["search"]["max distance away (KM)"] if params["search"].present?

    if @max_dist.present? && @breed.present?
      # @coords = session[:coords].transform_values(&:to_f)
      @pets = Pet.search_by_breed(@breed).near([@coords["lat"], @coords["lng"]], @max_dist.to_f)
    elsif @max_dist.present? && !@breed.present?
      # @coords = session[:coords].transform_values(&:to_f)
      @pets = Pet.near([@coords["lat"], @coords["lng"]], @max_dist.to_f)
    elsif !@max_dist.present? && @breed.present?
      @pets = Pet.search_by_breed(@breed)
    end

    # raise

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        image_url: helpers.asset_url('doggymarker.png')
      }
    end

  def blogpost1
  end

  def blogpost2
  end
end
end
