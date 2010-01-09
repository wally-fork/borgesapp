class HomepageController < ApplicationController
  # home page de la aplicacion, o bien, landing_page
  def home;  end
  def hexagon_home
    @username = params[:username]
    found_user = User.find_by_login(@username)
    
    respond_to do |format|
      if found_user.nil?
        format.html { redirect_to "home"}
      else
        format.html             # render view
      end
    end
    
  end
    
end
