class ClientActivityDatalistsController < ApplicationController
  before_action :set_client_activity_datalist, only: %i[ show edit update destroy ]

  def list
    @client_activity_datalists = ClientActivityDatalist.where("activity_id = ?",params[:id])
  end

  # GET /client_activity_datalists or /client_activity_datalists.json
  def index
    @client_activity_datalists = ClientActivityDatalist.all
  end

  # GET /client_activity_datalists/1 or /client_activity_datalists/1.json
  def show
  end

  # GET /client_activity_datalists/new
  def new
    @client_activity_datalist = ClientActivityDatalist.new
  end

  # GET /client_activity_datalists/1/edit
  def edit
    session[:return_to] = request.referer
  end

  # POST /client_activity_datalists or /client_activity_datalists.json
  def create
    @client_activity_datalist = ClientActivityDatalist.new(client_activity_datalist_params)

    respond_to do |format|
      if @client_activity_datalist.save
        format.html { redirect_to @client_activity_datalist, notice: "Client activity datalist was successfully created." }
        format.json { render :show, status: :created, location: @client_activity_datalist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_activity_datalist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_activity_datalists/1 or /client_activity_datalists/1.json
  def update
    respond_to do |format|
      if @client_activity_datalist.update(client_activity_datalist_params)
        format.html { redirect_to session.delete(:return_to), notice: "Client activity datalist was successfully updated." }
        format.json { render :show, status: :ok, location: @client_activity_datalist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_activity_datalist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_activity_datalists/1 or /client_activity_datalists/1.json
  def destroy
    @client_activity_datalist.destroy
    respond_to do |format|
      format.html { redirect_to client_activity_datalists_url, notice: "Client activity datalist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_activity_datalist
      @client_activity_datalist = ClientActivityDatalist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_activity_datalist_params
      params.require(:client_activity_datalist).permit(:link, :description, :file, :client_activity_id, :datalist_id)
    end
end
