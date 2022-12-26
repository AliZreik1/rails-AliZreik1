class DashboardController < ApplicationController
  def index
  
  end
  def switch_locale
  loc= params[:locale]
  session[:locale] =loc
  # I18n.locale=loc
  redirect_to root_path
  end

  def say_something
    @something = Time.now.to_s
    respond_to do |format|
      format.html{render layout:false}
      format.json{render json:{something:@something}}
    #render layout: false #To not replicate the layout (which is common between the pages ex : nav or footer)
    end
  end

end
