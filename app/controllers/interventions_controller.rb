class InterventionsController < ApplicationController
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]


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
    # session[:current_employee] = (current_employee['id'])
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
    @intervention.author_id = params[:user_id]

    logger.info(intervention_params)

# ---------------------     ZENDESK -------------------------

# ZendeskAPI::Ticket.create!($client,
#   :priority => "low",
#   :subject => "#{@intervention.author_id} from #{@intervention.employee_id}" ,
#   :comment => { :body => "The contact #{@intervention.author_id} from company #{@intervention.company_name} can be reached at email #{@intervention.email} and at phone number #{@intervention.phone_number}.
#   #{@intervention.department_in_charge} has a project named #{@intervention.project_name} which would require contribution from Rocket Elevators.

#   #{@intervention.project_description}
#   Attached Message: #{@intervention.message}
#   The contact uploaded an attachment"}
#   )
# ---------------------     ZENDESK -------------------------



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
  

