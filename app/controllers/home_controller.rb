class HomeController < ApplicationController

before_action :authenticate_user! 

  def index
  	@barbers = Barber.all
  	@users = User.all
  	@customers = Customer.all
  	@appointments = Appointment.all
  	@services = Service.all

  end
end
