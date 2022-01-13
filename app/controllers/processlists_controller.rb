class ProcesslistsController < ApplicationController
  before_action :set_processlist, only: %i[ show edit update destroy ]

  # GET /processlists or /processlists.json
  def index
    @processlists = Processlist.all
  end

  # GET /processlists/1 or /processlists/1.json
  def show
  end

  # GET /processlists/new
  def new
    @processlist = Processlist.new
  end

  # GET /processlists/1/edit
  def edit
  end

  # POST /processlists or /processlists.json
  def create
    @processlist = Processlist.new(processlist_params)

    respond_to do |format|
      if @processlist.save
        format.html { redirect_to @processlist, notice: "Processlist was successfully created." }
        format.json { render :show, status: :created, location: @processlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @processlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /processlists/1 or /processlists/1.json
  def update
    respond_to do |format|
      if @processlist.update(processlist_params)
        format.html { redirect_to @processlist, notice: "Processlist was successfully updated." }
        format.json { render :show, status: :ok, location: @processlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @processlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processlists/1 or /processlists/1.json
  def destroy
    @processlist.destroy
    respond_to do |format|
      format.html { redirect_to processlists_url, notice: "Processlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processlist
      @processlist = Processlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def processlist_params
      params.require(:processlist).permit(:name, :description)
    end
end
