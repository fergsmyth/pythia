class GameweeksController < ApplicationController
  before_action :set_gameweek, only: [:show, :edit, :update, :destroy]

  # GET /gameweeks
  # GET /gameweeks.json
  def index
    @gameweeks = Gameweek.all
  end

  # GET /gameweeks/1
  # GET /gameweeks/1.json
  def show
  end

  # GET /gameweeks/new
  def new
    @gameweek = Gameweek.new
  end

  # GET /gameweeks/1/edit
  def edit
  end

  # POST /gameweeks
  # POST /gameweeks.json
  def create
    @gameweek = Gameweek.new(gameweek_params)

    respond_to do |format|
      if @gameweek.save
        format.html { redirect_to @gameweek, notice: 'Gameweek was successfully created.' }
        format.json { render :show, status: :created, location: @gameweek }
      else
        format.html { render :new }
        format.json { render json: @gameweek.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gameweeks/1
  # PATCH/PUT /gameweeks/1.json
  def update
    respond_to do |format|
      if @gameweek.update(gameweek_params)
        format.html { redirect_to @gameweek, notice: 'Gameweek was successfully updated.' }
        format.json { render :show, status: :ok, location: @gameweek }
      else
        format.html { render :edit }
        format.json { render json: @gameweek.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gameweeks/1
  # DELETE /gameweeks/1.json
  def destroy
    @gameweek.destroy
    respond_to do |format|
      format.html { redirect_to gameweeks_url, notice: 'Gameweek was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gameweek
      @gameweek = Gameweek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gameweek_params
      params[:gameweek]
    end
end
