class PagesController < ApplicationController
  def home
    @pets = Pet.first(9)
  end
end
