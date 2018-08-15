class PaysheetsController < ApplicationController
  before_action :set_paysheet, only: [:show, :edit, :update, :destroy]
#controlador de Nomina
  # GET /paysheets
  # GET /paysheets.json
  def index
    @paysheets = Paysheet.all
  end

  # GET /paysheets/1
  # GET /paysheets/1.json
  def show
  end

  # GET /paysheets/new
  def new
    @paysheet = Paysheet.new
  end

  # GET /paysheets/1/edit
  def edit
  end

  # POST /paysheets
  # POST /paysheets.json
  def create
    @paysheet = Paysheet.new(paysheet_params)

    respond_to do |format|
      if @paysheet.save
        format.html { redirect_to @paysheet, notice: 'Paysheet was successfully created.' }
        format.json { render :show, status: :created, location: @paysheet }
      else
        format.html { render :new }
        format.json { render json: @paysheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paysheets/1
  # PATCH/PUT /paysheets/1.json
  def update
    respond_to do |format|
      if @paysheet.update(paysheet_params)
        format.html { redirect_to @paysheet, notice: 'Paysheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @paysheet }
      else
        format.html { render :edit }
        format.json { render json: @paysheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paysheets/1
  # DELETE /paysheets/1.json
  def destroy
    @paysheet.destroy
    respond_to do |format|
      format.html { redirect_to paysheets_url, notice: 'Paysheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paysheet
      @paysheet = Paysheet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paysheet_params
      params.require(:paysheet).permit(:dias_laborados, :valor_devengado, :deducciones, :neto_pagado, :id)
    end
end
