class LocationsController < ApplicationController
  def create
    session[:coords] = { lat: params[:lat], lng: params[:lng] }

    redirect_to root_path
  end
end
