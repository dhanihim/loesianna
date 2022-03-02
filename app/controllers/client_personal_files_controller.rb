class ClientPersonalFilesController < ApplicationController
  before_action :set_client_personal_file, only: %i[ show edit update destroy ]

  # GET /client_personal_files or /client_personal_files.json
  def index
    @client_personal_files = ClientPersonalFile.all
  end

  # GET /client_personal_files/1 or /client_personal_files/1.json
  def show
  end

  # GET /client_personal_files/new
  def new
    @client_personal_file = ClientPersonalFile.new
  end

  # GET /client_personal_files/1/edit
  def edit
    session[:return_to] = request.referer
  end

  # POST /client_personal_files or /client_personal_files.json
  def create
    @client_personal_file = ClientPersonalFile.new(client_personal_file_params)

    respond_to do |format|
      if @client_personal_file.save
        format.html { redirect_to @client_personal_file, notice: "Client personal file was successfully created." }
        format.json { render :show, status: :created, location: @client_personal_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_personal_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_personal_files/1 or /client_personal_files/1.json
  def update
    respond_to do |format|
      if @client_personal_file.update(client_personal_file_params)
        format.html { redirect_to session.delete(:return_to), notice: "Client personal file was successfully updated." }
        format.json { render :show, status: :ok, location: @client_personal_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_personal_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_personal_files/1 or /client_personal_files/1.json
  def destroy
    @client_personal_file.destroy
    respond_to do |format|
      format.html { redirect_to client_personal_files_url, notice: "Client personal file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_personal_file
      @client_personal_file = ClientPersonalFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_personal_file_params
      params.require(:client_personal_file).permit(:link, :description, :client_id, :personal_file_id, :file)
    end
end
