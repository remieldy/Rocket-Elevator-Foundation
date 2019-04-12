class InterventionsController < ApplicationController
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee!


  def get_buildings_from_customer
    render json: Building.where("customer_id = ?", params[:customer_id])
    end

  def get_battery_from_building
    render json: Battery.where("building_id = ?", params[:building_id])
    end

  def get_column_from_battery
    render json: Column.where("battery_id = ?", params[:battery_id])
    end

  def get_elevator_from_column
    render json: Elevator.where("column_id = ?", params[:column_id])
    end


  
  # GET /interventions
  # GET /interventions.json
  def index
    @interventions = Intervention.all
    @the_author_id = current_employee['id']
    session[:author_id] = @the_author_id
  end

  # GET /interventions/1
  # GET /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions
  # POST /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    @intervention.author_id = session[:author_id]
    @the_author = User.find(session[:author_id])
    @the_employee = User.find(params[:user_id])

    
    # @intervention. = params[:current_employee]
    logger.info(intervention_params)

# ---------------------------------  ZENDESK  ----------------------------------
# ---------------------------------  ZENDESK  ----------------------------------
puts "this is the employee id #{params[:user_id]}"


ZendeskAPI::Ticket.create!($client,
  :priority => "low",
  :subject => "#{@intervention.author_id} from #{@the_employee.first_name}",


  :comment => { :body => "The Author is : #{@the_author.first_name}  
client is : #{@intervention.customer.company_name}
customer ID is : #{@intervention.customer_id}
building ID is : #{@intervention.building_id} 
Battery ID is : #{@intervention.battery_id} 
Column ID is : #{@intervention.column_id} 
Elevator ID (if specified) is : #{@intervention.elevator_id} 
Employee (if specified) is : #{@the_employee.first_name}
Description of report : #{@intervention.report}"}

)
# ---------------------------------  ZENDESK  ----------------------------------
# ---------------------------------  ZENDESK  ----------------------------------


    respond_to do |format|
      if @intervention.save
        format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1
  # PATCH/PUT /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1
  # DELETE /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: 'Intervention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intervention_params
      #params.fetch(:intervention, {})
      params.permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :intervention_start, :intervention_finish, :results, :report, :status )
    end
end
  

