class LeadErrorsController < ApplicationController
  before_action :set_lead_error, only: %i[ show edit update destroy ]

  # GET /lead_errors or /lead_errors.json
  def index
    @lead_errors = LeadError.all
  end

  # GET /lead_errors/1 or /lead_errors/1.json
  def show
  end

  # GET /lead_errors/new
  def new
    @lead_error = LeadError.new
  end

  # GET /lead_errors/1/edit
  def edit
  end

  # POST /lead_errors or /lead_errors.json
  def create
    @lead_error = LeadError.new(lead_error_params)

    respond_to do |format|
      if @lead_error.save
        format.html { redirect_to @lead_error, notice: "Lead error was successfully created." }
        format.json { render :show, status: :created, location: @lead_error }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lead_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lead_errors/1 or /lead_errors/1.json
  def update
    respond_to do |format|
      if @lead_error.update(lead_error_params)
        format.html { redirect_to @lead_error, notice: "Lead error was successfully updated." }
        format.json { render :show, status: :ok, location: @lead_error }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lead_errors/1 or /lead_errors/1.json
  def destroy
    @lead_error.destroy
    respond_to do |format|
      format.html { redirect_to lead_errors_url, notice: "Lead error was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_error
      @lead_error = LeadError.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_error_params
      params.require(:lead_error).permit(:lead_id, :column, :value, :description)
    end
end
