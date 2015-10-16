class GameweekEventsController < ApplicationController
  before_action :set_gameweek_event, only: [:show, :edit, :update, :destroy]

  # GET /gameweek_events
  # GET /gameweek_events.json
  def index
    @gameweek_events = GameweekEvent.all
  end

  # GET /gameweek_events/1
  # GET /gameweek_events/1.json
  def show
  end

  # GET /gameweek_events/new
  def new
    @gameweek_event = GameweekEvent.new
  end

  # GET /gameweek_events/1/edit
  def edit
  end

  # POST /gameweek_events
  # POST /gameweek_events.json
  def create
    @gameweek_event = GameweekEvent.new(gameweek_event_params)

    respond_to do |format|
      if @gameweek_event.save
        format.html { redirect_to @gameweek_event, notice: 'Gameweek event was successfully created.' }
        format.json { render :show, status: :created, location: @gameweek_event }
      else
        format.html { render :new }
        format.json { render json: @gameweek_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gameweek_events/1
  # PATCH/PUT /gameweek_events/1.json
  def update
    respond_to do |format|
      if @gameweek_event.update(gameweek_event_params)
        format.html { redirect_to @gameweek_event, notice: 'Gameweek event was successfully updated.' }
        format.json { render :show, status: :ok, location: @gameweek_event }
      else
        format.html { render :edit }
        format.json { render json: @gameweek_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gameweek_events/1
  # DELETE /gameweek_events/1.json
  def destroy
    @gameweek_event.destroy
    respond_to do |format|
      format.html { redirect_to gameweek_events_url, notice: 'Gameweek event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gameweek_event
      @gameweek_event = GameweekEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameweek_event_params
      params.require(:gameweek_event).permit(:fixture_id, :player_id, :kickoff, :minutes_player, :goals_scored, :assists, :clean_sheets, :goals_conceded, :own_goals, :penalties_saved, :penalties_missed, :yellow_cards, :red_cards, :saves, :bonus_points, :esp, :bps, :net_transfers, :value, :point)
    end
end
