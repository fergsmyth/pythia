class ScrapperJobsController < ApplicationController
  require 'json'
  before_action :set_scrapper_job, only: [:show, :edit, :update, :destroy]

  # GET /scrapper_jobs
  # GET /scrapper_jobs.json
  def index
    @scrapper_jobs = ScrapperJob.all
  end

  # GET /scrapper_jobs/1
  # GET /scrapper_jobs/1.json
  def show
  end

  # GET /scrapper_jobs/new
  def new
    @scrapper_job = ScrapperJob.new
  end

  # GET /scrapper_jobs/1/edit
  def edit
  end

  # POST /scrapper_jobs
  # POST /scrapper_jobs.json
  def create
    @scrapper_job = ScrapperJob.new(scrapper_job_params)

    file = File.read(Dir.pwd+"/scriplets/sample html/player.json")

    data_hash = JSON.parse(file)

    player = Player.find_or_create_by(ff_id: data_hash['id'])
    player.scrapper_job_id = @scrapper_job.id
    player.populate data_hash 
    player.save

    events_array = data_hash['fixture_history']['all']
    events_array.each do |event| 
      opp_team = Team.find_by(short_name: event[2][0..2])
      if event[2][4] == 'H'
        fixture = Fixture.find_or_create_by(home_team: player.team, away_team: opp_team)
      else
        fixture = Fixture.find_or_create_by(home_team: opp_team, away_team: player.team)
      end

      # This will need to be changed to take into account a player changing team
      player_fixture_performance = PlayerFixturePerformance.find_or_create_by(player: player, fixture: fixture)
      player_fixture_performance.populate event
      player_fixture_performance.scrapper_job_id = @scrapper_job.id
      player_fixture_performance.save
    end

    fixtures_array = data_hash['fixtures']['all']
    fixtures_array.each do |fixture_element|
      
    end

    respond_to do |format|
      if @scrapper_job.save
        format.html { redirect_to @scrapper_job, notice: 'Scrapper job was successfully created.' }
        format.json { render :show, status: :created, location: @scrapper_job }
      else
        format.html { render :new }
        format.json { render json: @scrapper_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrapper_jobs/1
  # PATCH/PUT /scrapper_jobs/1.json
  def update
    respond_to do |format|
      if @scrapper_job.update(scrapper_job_params)
        format.html { redirect_to @scrapper_job, notice: 'Scrapper job was successfully updated.' }
        format.json { render :show, status: :ok, location: @scrapper_job }
      else
        format.html { render :edit }
        format.json { render json: @scrapper_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapper_jobs/1
  # DELETE /scrapper_jobs/1.json
  def destroy
    @scrapper_job.destroy
    respond_to do |format|
      format.html { redirect_to scrapper_jobs_url, notice: 'Scrapper job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrapper_job
      @scrapper_job = ScrapperJob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrapper_job_params
      params[:scrapper_job]
    end
end
