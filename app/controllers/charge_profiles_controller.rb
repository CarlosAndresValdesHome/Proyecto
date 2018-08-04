class ChargeProfilesController < ApplicationController
  before_action :set_charge_profile, only: [:show, :edit, :update, :destroy]

  # GET /charge_profiles
  # GET /charge_profiles.json
  def index
    @charge_profiles = ChargeProfile.all
    render 'index', layout: 'homeEmpresa'
  end

  # GET /charge_profiles/1
  # GET /charge_profiles/1.json
  def show
  end

  # GET /charge_profiles/new
  def new
    @charge_profile = ChargeProfile.new
    render 'new', layout: 'homeEmpresa'
  end

  # GET /charge_profiles/1/edit
  def edit
    render 'edit', layout: 'homeEmpresa'
  end

  # POST /charge_profiles
  # POST /charge_profiles.json
  def create
    @charge_profile = ChargeProfile.new(charge_profile_params)

    respond_to do |format|
      if @charge_profile.save
        format.html { redirect_to @charge_profile, notice: 'Charge profile was successfully created.' }
        format.json { render :show, status: :created, location: @charge_profile }
      else
        format.html { render :new }
        format.json { render json: @charge_profile.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PATCH/PUT /charge_profiles/1
  # PATCH/PUT /charge_profiles/1.json
  def update
    respond_to do |format|
      if @charge_profile.update(charge_profile_params)
        format.html { redirect_to @charge_profile, notice: 'Charge profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge_profile }
      else
        format.html { render :edit }
        format.json { render json: @charge_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charge_profiles/1
  # DELETE /charge_profiles/1.json
  def destroy
    @charge_profile.destroy
    respond_to do |format|
      format.html { redirect_to charge_profiles_url, notice: 'Charge profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge_profile
      @charge_profile = ChargeProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_profile_params
      params.require(:charge_profile).permit(:id, :descripcion)
    end
end
