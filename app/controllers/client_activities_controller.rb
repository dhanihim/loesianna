class ClientActivitiesController < ApplicationController
  before_action :set_client_activity, only: %i[ show edit update destroy ]

  # GET /client_activities or /client_activities.json
  def index
    @client_activities = ClientActivity.all
  end

  # GET /client_activities/1 or /client_activities/1.json
  def show
  end

  # GET /client_activities/new
  def new
    @client_activity = ClientActivity.new
  end

  # GET /client_activities/1/edit
  def edit
  end

  # POST /client_activities or /client_activities.json
  def create
    @client_activity = ClientActivity.new(client_activity_params)

    respond_to do |format|
      if @client_activity.save
        format.html { redirect_to @client_activity, notice: "Client activity was successfully created." }
        format.json { render :show, status: :created, location: @client_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_activities/1 or /client_activities/1.json
  def update
    respond_to do |format|
      if @client_activity.update(client_activity_params)
        format.html { redirect_to @client_activity, notice: "Client activity was successfully updated." }
        format.json { render :show, status: :ok, location: @client_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_activities/1 or /client_activities/1.json
  def destroy
    @client_activity.destroy
    respond_to do |format|
      format.html { redirect_to client_activities_url, notice: "Client activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_activity
      @client_activity = ClientActivity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_activity_params
      params.require(:client_activity).permit(:client_id, :activity_id, :object, :associate, :assistant, :activity_expired, :certificate_expired, :serial_number, :offline_location, :description, :status, :deleted)
    end
end
