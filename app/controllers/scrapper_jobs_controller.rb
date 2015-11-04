class ScrapperJobsController < ApplicationController
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
    @scrapper_job.scrape_ff

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
