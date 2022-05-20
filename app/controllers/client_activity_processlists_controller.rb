class ClientActivityProcesslistsController < ApplicationController
  before_action :set_client_activity_processlist, only: %i[ show edit update destroy ]

  def finish
      session[:return_to] ||= request.referer

      @client_activity_processlist = ClientActivityProcesslist.find(params[:id])
      @client_activity_processlist.status = 2

      respond_to do |format|
        if @client_activity_processlist.save

          @total_done = ClientActivityProcesslist.where("client_activity_id = ? AND status = 2",@client_activity_processlist.client_activity_id).count
          @total_process = ClientActivityProcesslist.where("client_activity_id = ?",@client_activity_processlist.client_activity_id).count

          @client_activity = ClientActivity.find(@client_activity_processlist.client_activity_id);
            
          if(@total_done==(@total_process))
            @client_activity.status = 2
          end

          #@client_activity.description = "Done "+@total_done.to_s+" | Process "+@total_process.to_s
          @client_activity.save

          format.html { redirect_to session.delete(:return_to), notice: "Client activity processlist was successfully updated." }
          format.json { render :show, status: :created, location: @client_activity_processlist }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @client_activity_processlist.errors, status: :unprocessable_entity }
        end
      end
  end

  # GET /client_activity_processlists or /client_activity_processlists.json
  def index
    @client_activity_processlists = ClientActivityProcesslist.all
  end

  # GET /client_activity_processlists/1 or /client_activity_processlists/1.json
  def show
  end

  # GET /client_activity_processlists/new
  def new
    @client_activity_processlist = ClientActivityProcesslist.new
  end

  # GET /client_activity_processlists/1/edit
  def edit
    session[:return_to] = request.referer
  end

  # POST /client_activity_processlists or /client_activity_processlists.json
  def create
    @client_activity_processlist = ClientActivityProcesslist.new(client_activity_processlist_params)

    respond_to do |format|
      if @client_activity_processlist.save
        format.html { redirect_to @client_activity_processlist, notice: "Client activity processlist was successfully created." }
        format.json { render :show, status: :created, location: @client_activity_processlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_activity_processlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_activity_processlists/1 or /client_activity_processlists/1.json
  def update

    respond_to do |format|
      if @client_activity_processlist.update(client_activity_processlist_params)
        
        @client_activity_processlist.status = 1
        @client_activity_processlist.save

        format.html { redirect_to session.delete(:return_to), notice: "Client activity processlist was successfully updated." }
        format.json { render :show, status: :ok, location: @client_activity_processlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_activity_processlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_activity_processlists/1 or /client_activity_processlists/1.json
  def destroy
    @client_activity_processlist.destroy
    respond_to do |format|
      format.html { redirect_to client_activity_processlists_url, notice: "Client activity processlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_activity_processlist
      @client_activity_processlist = ClientActivityProcesslist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_activity_processlist_params
      params.require(:client_activity_processlist).permit(:target_start, :actual_start, :status, :description, :client_activity_id, :processlist_id)
    end
end
