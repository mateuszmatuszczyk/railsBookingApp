class HomeController < ApplicationController
  def index
  	@barbers = Barber.all
  end
end
