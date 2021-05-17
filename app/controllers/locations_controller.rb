class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create

  def create
    session[:coords] = { lat: params[:lat], lng: params[:lng] }
  end
end
