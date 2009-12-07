class HomepageController < ApplicationController
  # home page de la aplicacion, o bien, landing_page
  def home;  end
  def hexagon_home
    @username = params[:username]
    
    respond_to do |format|
      format.html
    end
    
  end
end
