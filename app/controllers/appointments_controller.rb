class AppointmentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :ensure_admin
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]


  def ensure_admin
    unless current_user && current_user.admin?
      render :text => "Access Error Message", :status => :unauthorized
    end
  end
  # GET /appointments
  # GET /appointments.json
  
  def index
  @customer = Customer.find(params[:customer_id])
  @appointments = @customer.appointments
  end

  def show
  @customer = Customer.find(params[:customer_id])
  @appointment = @customer.appointments.find(params[:id])
  end

  # GET /movies/1/reviews/new
def new 
@customer = Customer.find(params[:customer_id])

# Associate an review object with movie 1
@appointment = @customer.appointments.build
end

  # GET /appointments/1/edit
# GET /movies/1/reviews/2/edit
def edit
@customer= Customer.find(params[:customer_id])
# For URL like /movies/1/reviews/2/edit
# Get review id=2 for movie 1
@appointment = @customer.appointments.find(params[:id])
end


  # POST /movies/1/reviews
  def create
  @customer= Customer.find(params[:customer_id])
  
  @appointment = @customer.appointments.build(params.require(:appointment).permit(:status))
  if @appointment.save
  # Save the review successfully
  redirect_to customer_appointment_url(@customer, @appointment)
  else
  render :action => "new"
  end
  end


  # POST /appointments
  # POST /appointments.json
  # def create
  # @appointment = Appointment.new(appointment_params)

  # respond_to do |format|
  #   if @appointment.save
  #     format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
  #     format.json { render :show, status: :created, location: @appointment }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @appointment.errors, status: :unprocessable_entity }
  #   end
  # end
  # end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  #  DELETE /appointments/1.json
  # def destroy
  #   @appointment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # DELETE /movies/1/reviews/2
def destroy
@customer = Customer.find(params[:customer_id])
@appointment = Appointment.find(params[:appointment_id])
@appointment.destroy
respond_to do |format|
format.html { redirect_to customer_appointments_path(@customer) }
format.xml { head :ok }
end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:appointment_time, :appointment_date, :appointment_duration, :total_cost, :status, :customer_id, :barber_id)
    end
end
