# frozen_string_literal: true

class FatesController < ApplicationController
  before_action :set_fate, only: %i[show edit update destroy]

  # GET /fates
  # GET /fates.json
  def index
    @fates = Fate.all
  end

  # GET /fates/1
  # GET /fates/1.json
  def show; end

  # GET /fates/new
  def new
    @fate = Fate.new
  end

  # GET /fates/1/edit
  def edit; end

  # POST /fates
  # POST /fates.json
  def create
    @fate = Fate.new(fate_params)

    respond_to do |format|
      if @fate.save
        format.html { redirect_to @fate, notice: 'Fate was successfully created.' }
        format.json { render :show, status: :created, location: @fate }
      else
        format.html { render :new }
        format.json { render json: @fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fates/1
  # PATCH/PUT /fates/1.json
  def update
    respond_to do |format|
      if @fate.update(fate_params)
        format.html { redirect_to @fate, notice: 'Fate was successfully updated.' }
        format.json { render :show, status: :ok, location: @fate }
      else
        format.html { render :edit }
        format.json { render json: @fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fates/1
  # DELETE /fates/1.json
  def destroy
    @fate.destroy
    respond_to do |format|
      format.html { redirect_to fates_url, notice: 'Fate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fate
    @fate = Fate.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fate_params
    params.require(:fate).permit(:hunter_id, :found_out_list)
  end
end
