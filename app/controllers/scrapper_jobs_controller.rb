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

    player.display_name =  data_hash['web_name']# display_name
    player.position = data_hash['type_name']# position
    player.selected_by = data_hash['selected_by'].to_f# selected_by STring to float
    player.total_points =  data_hash['total_points']# total_points
    player.team_code = data_hash['team_code']# team_code use to find actual team? Maybe doesnt need to be persisted?
    player.team = Team.find_by code: player.team_code
    player.news = data_hash['news']# news
    player.status = data_hash['status']# status
    player.code = data_hash['code']# code
    player.first_name = data_hash['first_name']# first_name
    player.second_name = data_hash['second_name']# second_name
    player.now_cost = data_hash['now_cost'] * 0.1 # now_cost
    player.chance_of_playing_this_round = data_hash['chance_of_playing_this_round']# newchance_of_playing_this_rounds
    player.chance_of_playing_next_round = data_hash['chance_of_playing_next_round']# chance_of_playing_next_round can be null
    player.value_form = data_hash['value_form'].to_f # value_form STRING
    player.value_season = data_hash['value_season'].to_f # value_season STRING
    player.cost_change_start = data_hash['cost_change_start'] * 0.1 # cost_change_start
    player.cost_change_start_fall = data_hash['cost_change_start_fall'] * 0.1  # cost_change_start_fall
    player.in_dreamteam = data_hash['in_dreamteam']# in_dreamteam
    player.dreamteam_count = data_hash['dreamteam_count']# dreamteam_count
    player.selected_by_percent = data_hash['selected_by_percent'].to_f # selected_by_percent STRING
    player.form = data_hash['form'].to_f # form STRING
    player.transfers_out = data_hash['transfers_out']# transfers_out
    player.transfers_in = data_hash['transfers_in']# transfers_in
    player.loans_in = data_hash['loans_in']# loans_in
    player.loans_out = data_hash['loans_out']# loans_out
    player.loaned_in = data_hash['loaned_in']# loaned_in
    player.loaned_out = data_hash['loaned_out']# loaned_out
    player.points_per_game = data_hash['points_per_game'].to_f# points_per_game STRING
    player.ep_this = data_hash['ep_this'].to_f # ep_this STRING
    player.ep_next = data_hash['ep_next'].to_f # ep_next STRING
    player.special = data_hash['special']# special (boolean)

    player.save
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
