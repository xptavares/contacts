class ImportErrorsController < ApplicationController
  before_action :set_import_error, only: %i[ show edit update destroy ]

  # GET /import_errors or /import_errors.json
  def index
    @import_errors = current_user.import_errors.paginate(page: params[:page])
    @import_errors = @import_errors.where(import_id: params[:import_id]) if params[:import_id].present?
  end

  # GET /import_errors/1 or /import_errors/1.json
  def show
  end

  # GET /import_errors/new
  def new
    @import_error = ImportError.new
  end

  # GET /import_errors/1/edit
  def edit
  end

  # POST /import_errors or /import_errors.json
  def create
    @import_error = ImportError.new(import_error_params)

    respond_to do |format|
      if @import_error.save
        format.html { redirect_to @import_error, notice: "Import error was successfully created." }
        format.json { render :show, status: :created, location: @import_error }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @import_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /import_errors/1 or /import_errors/1.json
  def update
    respond_to do |format|
      if @import_error.update(import_error_params)
        format.html { redirect_to @import_error, notice: "Import error was successfully updated." }
        format.json { render :show, status: :ok, location: @import_error }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @import_error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /import_errors/1 or /import_errors/1.json
  def destroy
    @import_error.destroy
    respond_to do |format|
      format.html { redirect_to import_errors_url, notice: "Import error was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import_error
      @import_error = current_user.import_errors.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def import_error_params
      params.require(:import_error).permit(:import_id, :column, :value, :description)
    end
end
