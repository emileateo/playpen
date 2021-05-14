class LocationsController < ApplicationController
  def create
    session[:coords] = { lat: params[:lat], lng: params[:lng] }
  end
end
