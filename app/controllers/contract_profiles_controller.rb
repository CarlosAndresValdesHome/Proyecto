class ContractProfilesController < ApplicationController
  before_action :set_contract_profile, only: [:show, :edit, :update, :destroy]
#contolador de Perfil Contratos
  # GET /contract_profiles
  # GET /contract_profiles.json
  def index
    @contract_profiles = ContractProfile.all
    render 'index', layout: 'homeEmpresa'
    
  end

  # GET /contract_profiles/1
  # GET /contract_profiles/1.json
  def show
    render 'show', layout: 'homeEmpresa'
  end

  # GET /contract_profiles/new
  def new
    @contract_profile = ContractProfile.new
    render 'new', layout: 'homeEmpresa'
  end

  # GET /contract_profiles/1/edit
  def edit
    render 'edit', layout: 'homeEmpresa'
  end

  # POST /contract_profiles
  # POST /contract_profiles.json
  def create
    @contract_profile = ContractProfile.new(contract_profile_params)

    respond_to do |format|
      if @contract_profile.save
        format.html { redirect_to @contract_profile, notice: 'Contract profile was successfully created.' }
        format.json { render :show, status: :created, location: @contract_profile }
      else
        format.html { render :new }
        format.json { render json: @contract_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_profiles/1
  # PATCH/PUT /contract_profiles/1.json
  def update
    respond_to do |format|
      if @contract_profile.update(contract_profile_params)
        format.html { redirect_to @contract_profile, notice: 'Contract profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract_profile }
      else
        format.html { render :edit }
        format.json { render json: @contract_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_profiles/1
  # DELETE /contract_profiles/1.json
  def destroy
    @contract_profile.destroy
    respond_to do |format|
      format.html { redirect_to contract_profiles_url, notice: 'Contract profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_profile
      @contract_profile = ContractProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_profile_params
      params.require(:contract_profile).permit(:id, :descripcion, :id_contratos)
    end
end
