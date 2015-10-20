class PlayerFixturePerformancesController < ApplicationController
  before_action :set_player_fixture_performance, only: [:show, :edit, :update, :destroy]

  # GET /player_fixture_performances
  # GET /player_fixture_performances.json
  def index
    @player_fixture_performances = PlayerFixturePerformance.all
  end

  # GET /player_fixture_performances/1
  # GET /player_fixture_performances/1.json
  def show
  end

  # GET /player_fixture_performances/new
  def new
    @player_fixture_performance = PlayerFixturePerformance.new
  end

  # GET /player_fixture_performances/1/edit
  def edit
  end

  # POST /player_fixture_performances
  # POST /player_fixture_performances.json
  def create
    @player_fixture_performance = PlayerFixturePerformance.new(player_fixture_performance_params)

    respond_to do |format|
      if @player_fixture_performance.save
        format.html { redirect_to @player_fixture_performance, notice: 'Player fixture performance was successfully created.' }
        format.json { render :show, status: :created, location: @player_fixture_performance }
      else
        format.html { render :new }
        format.json { render json: @player_fixture_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_fixture_performances/1
  # PATCH/PUT /player_fixture_performances/1.json
  def update
    respond_to do |format|
      if @player_fixture_performance.update(player_fixture_performance_params)
        format.html { redirect_to @player_fixture_performance, notice: 'Player fixture performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_fixture_performance }
      else
        format.html { render :edit }
        format.json { render json: @player_fixture_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_fixture_performances/1
  # DELETE /player_fixture_performances/1.json
  def destroy
    @player_fixture_performance.destroy
    respond_to do |format|
      format.html { redirect_to player_fixture_performances_url, notice: 'Player fixture performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_fixture_performance
      @player_fixture_performance = PlayerFixturePerformance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_fixture_performance_params
      params.require(:player_fixture_performance).permit(:fixture_id, :player_id, :kickoff, :minutes_player, :goals_scored, :assists, :clean_sheets, :goals_conceded, :own_goals, :penalties_saved, :penalties_missed, :yellow_cards, :red_cards, :saves, :bonus_points, :esp, :bps, :net_transfers, :value, :point)
    end
end
