class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :abc, only: [:index]
  def home
  end

  def index
  end

  def create
    # receive city from page.html form 
    # redirect bike: index.html with city value
  end 

end
