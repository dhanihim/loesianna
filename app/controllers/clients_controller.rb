class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  def searchresult
    @query = params[:query]

    if(!@query.nil?)
      @clients = Client.where("(name LIKE ? or uid LIKE ?) and deleted = 0", "%#{@query}%", "%#{@query}%")
    else
      @clients = Client.where("deleted = 0")
    end
  end

  # GET /clients or /clients.json
  def index
    @clients = Client.all

    @newclient = Client.new
  end

  # GET /clients/1 or /clients/1.json
  def show
    @client_activity = ClientActivity.where("client_id = ? AND deleted = 0", params[:id])

    @status_array = ["Tidak Aktif","Proses","Selesai","Dihapus"]
    @color_array = ["grey","blue","green","red"]
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
    @personal_files = PersonalFile.where("deleted = 0")

    @personal_files.each do |personal_file|
      checking = ClientPersonalFile.where("personal_file_id = ? AND client_id = ?", personal_file.id, params[:id]).count

      if(checking==0)
        @client_personal_file = ClientPersonalFile.new
        @client_personal_file.personal_file_id = personal_file.id
        @client_personal_file.client_id = params[:id]

        @client_personal_file.save
      end
    end

    @client_personal_files = ClientPersonalFile.where("client_id = ?", params[:id])
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save

        #ADDING PERSONAL FILES TO EACH CLIENT
        @personal_files = PersonalFile.where("deleted = 0")

        @personal_files.each do |personal_file|
          @client_personal_file = ClientPersonalFile.new
          @client_personal_file.personal_file_id = personal_file.id
          @client_personal_file.client_id = @client.id

          @client_personal_file.save
        end

        format.html { redirect_to clients_url, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :uid, :birthdate, :birthplace, :address, :phone, :spouse, :spouse_uid, :status, :description, :city, :deleted)
    end
end
