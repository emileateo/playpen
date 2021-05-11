class PagesController < ApplicationController
  def home
    @pets = Pet.first(5)
  end
end
