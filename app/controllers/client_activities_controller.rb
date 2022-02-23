 class ClientActivitiesController < ApplicationController
  before_action :set_client_activity, only: %i[ show edit update destroy ]

  def summary
    @client_activity = ClientActivity.where("id = ?", params[:id])
  end

  def datalist
    @status_array = ["Belum Dimulai","Proses","Selesai","Terlambat"]
    @color_array = ["grey","blue","green","red"]
    
    if(!params[:activity_id].nil?)
        checking = ClientActivityDatalist.where("client_activity_id = ?", params[:id]).count
        if(checking==0)
          @datalist = Datalist.where("activity_id = ?", params[:activity_id])

          @datalist.each do |datalist|
            @client_activity_datalist = ClientActivityDatalist.new
            @client_activity_datalist.client_activity_id = params[:id]
            @client_activity_datalist.datalist_id = datalist.id

            @client_activity_datalist.save
          end
        end
    end

    @client_activity_datalist = ClientActivityDatalist.where("client_activity_id = ?", params[:id])
  end

  def processlist
    @uncheck = 1

    @status_array = ["Belum Dimulai","Proses","Selesai","Terlambat"]
    @color_array = ["grey","blue","green","red"]

    if(!params[:activity_id].nil?)
        checking = ClientActivityProcesslist.where("client_activity_id = ?", params[:id]).count
        if(checking==0)
          @processlist = Processlist.where("activity_id = ?", params[:activity_id])

          @processlist.each do |processlist|
            @client_activity_processlist = ClientActivityProcesslist.new
            @client_activity_processlist.client_activity_id = params[:id]
            @client_activity_processlist.processlist_id = processlist.id

            @client_activity_processlist.save
          end
        end
    end

    @client_activity_processlist = ClientActivityProcesslist.where("client_activity_id = ?", params[:id])
  end

  # GET /client_activities or /client_activities.json
  def index
    @client_activities = ClientActivity.where("deleted = 0")

    @status_array = ["Tidak Aktif","Proses","Selesai","Dihapus"]
    @color_array = ["grey","blue","green","red"]
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
    @status_array = ["Belum Dimulai","Proses","Selesai","Terlambat"]
    @color_array = ["grey","blue","green","red"]
    
    @client_activity_datalist = ClientActivityDatalist.where("client_activity_id = ?", params[:id])
    @client_activity_processlist = ClientActivityProcesslist.where("client_activity_id = ?", params[:id])
  end

  # POST /client_activities or /client_activities.json
  def create
    @client_activity = ClientActivity.new(client_activity_params)

    respond_to do |format|
      if @client_activity.save
        format.html { redirect_to datalist_client_activity_path(@client_activity, :activity_id => @client_activity.activity_id), notice: "Client activity was successfully created." }
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
    @client_activity.deleted = 1
    @client_activity.save

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
