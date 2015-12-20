class TeamSheetsController < ApplicationController
  before_action :set_team_sheet, only: [:show, :edit, :update, :destroy]

  # GET /team_sheets
  # GET /team_sheets.json
  def index
    @team_sheets = TeamSheet.all
  end

  # GET /team_sheets/1
  # GET /team_sheets/1.json
  def show
  end

  # GET /team_sheets/new
  def new
    @team_sheet = TeamSheet.new
  end

  # GET /team_sheets/1/edit
  def edit
  end

  # POST /team_sheets
  # POST /team_sheets.json
  def create
    @team_sheet = TeamSheet.new(team_sheet_params)

    respond_to do |format|
      if @team_sheet.save
        format.html { redirect_to @team_sheet, notice: 'Team sheet was successfully created.' }
        format.json { render :show, status: :created, location: @team_sheet }
      else
        format.html { render :new }
        format.json { render json: @team_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_sheets/1
  # PATCH/PUT /team_sheets/1.json
  def update
    respond_to do |format|
      if @team_sheet.update(team_sheet_params)
        format.html { redirect_to @team_sheet, notice: 'Team sheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_sheet }
      else
        format.html { render :edit }
        format.json { render json: @team_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_sheets/1
  # DELETE /team_sheets/1.json
  def destroy
    @team_sheet.destroy
    respond_to do |format|
      format.html { redirect_to team_sheets_url, notice: 'Team sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_sheet
      @team_sheet = TeamSheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_sheet_params
      params.require(:team_sheet).permit(:name)
    end
end
