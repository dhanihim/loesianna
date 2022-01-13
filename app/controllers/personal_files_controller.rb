class PersonalFilesController < ApplicationController
  before_action :set_personal_file, only: %i[ show edit update destroy ]

  # GET /personal_files or /personal_files.json
  def index
    @personal_files = PersonalFile.all
  end

  # GET /personal_files/1 or /personal_files/1.json
  def show
  end

  # GET /personal_files/new
  def new
    @personal_file = PersonalFile.new
  end

  # GET /personal_files/1/edit
  def edit
  end

  # POST /personal_files or /personal_files.json
  def create
    @personal_file = PersonalFile.new(personal_file_params)

    respond_to do |format|
      if @personal_file.save
        format.html { redirect_to personal_files_url, notice: "Personal file was successfully created." }
        format.json { render :show, status: :created, location: @personal_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_files/1 or /personal_files/1.json
  def update
    respond_to do |format|
      if @personal_file.update(personal_file_params)
        format.html { redirect_to personal_files_url, notice: "Personal file was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_files/1 or /personal_files/1.json
  def destroy
    @personal_file.destroy
    respond_to do |format|
      format.html { redirect_to personal_files_url, notice: "Personal file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_file
      @personal_file = PersonalFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_file_params
      params.require(:personal_file).permit(:name, :description, :deleted)
    end
end
