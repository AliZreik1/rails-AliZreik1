class HomeController < ApplicationController
  
  def index
    
      @date=params[:date].present? ? Date.parse(params[:date]):Date.today.beginning_of_month
      
  end

  
end
