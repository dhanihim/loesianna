class DatalistsController < ApplicationController
  before_action :set_datalist, only: %i[ show edit update destroy ]

  # GET /datalists or /datalists.json
  def index
    @datalists = Datalist.all
  end

  # GET /datalists/1 or /datalists/1.json
  def show
  end

  # GET /datalists/new
  def new
    @datalist = Datalist.new
  end

  # GET /datalists/1/edit
  def edit
  end

  # POST /datalists or /datalists.json
  def create
    @datalist = Datalist.new(datalist_params)

    respond_to do |format|
      if @datalist.save
        format.html { redirect_to @datalist, notice: "Datalist was successfully created." }
        format.json { render :show, status: :created, location: @datalist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @datalist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /datalists/1 or /datalists/1.json
  def update
    respond_to do |format|
      if @datalist.update(datalist_params)
        format.html { redirect_to @datalist, notice: "Datalist was successfully updated." }
        format.json { render :show, status: :ok, location: @datalist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @datalist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /datalists/1 or /datalists/1.json
  def destroy
    @datalist.destroy
    respond_to do |format|
      format.html { redirect_to datalists_url, notice: "Datalist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datalist
      @datalist = Datalist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def datalist_params
      params.require(:datalist).permit(:name, :description, :activity_id)
    end
end
