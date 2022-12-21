class DashboardController < ApplicationController
  def index
  
  end
  def switch_locale
  loc= params[:locale]
  session[:locale] =loc
  # I18n.locale=loc
  redirect_to root_path
  end
end
