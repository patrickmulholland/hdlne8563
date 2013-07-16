class HomeController < ApplicationController
  
  before_filter :only_logged_out
  
  def index
  end

  def only_logged_out
    if user_signed_in?
      redirect_to headlines_path
    end
  end
  
  
end