class PagesController < ApplicationController
  def home
    @pets = Pet.all
    @search = params["search"]

    if @search.present?
      @breed = @search["breed"]
      @pets = Pet.search_by_breed(params["search"]["breed"])
    end
  end
end
