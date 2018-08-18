class UserModifiedsController < ApplicationController
  before_action :set_user_modified, only: [:show, :edit, :update, :destroy]
#controlador de Usuarios
  # GET /user_modifieds
  # GET /user_modifieds.json
  def index
    @user_modifieds = UserModified.all
  end

  # GET /user_modifieds/1
  # GET /user_modifieds/1.json
  def show
  end

  # GET /user_modifieds/new
  def new
    @user_modified = UserModified.new
  end

  # GET /user_modifieds/1/edit
  def edit
  end

  # POST /user_modifieds
  # POST /user_modifieds.json
  def create
    @user_modified = UserModified.new(user_modified_params)

    respond_to do |format|
      if @user_modified.save
        format.html { redirect_to @user_modified, notice: 'User modified was successfully created.' }
        format.json { render :show, status: :created, location: @user_modified }
      else
        format.html { render :new }
        format.json { render json: @user_modified.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_modifieds/1
  # PATCH/PUT /user_modifieds/1.json
  def update
    respond_to do |format|
      if @user_modified.update(user_modified_params)
        format.html { redirect_to @user_modified, notice: 'User modified was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_modified }
      else
        format.html { render :edit }
        format.json { render json: @user_modified.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_modifieds/1
  # DELETE /user_modifieds/1.json
  def destroy
    @user_modified.destroy
    respond_to do |format|
      format.html { redirect_to user_modifieds_url, notice: 'User modified was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_modified
      @user_modified = UserModified.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_modified_params
      params.require(:user_modified).permit(:id, :nombre, :apellido, :direccion, :telefono, :email, :id_empresa, :id_perfil, :id_perfil_cargo, :id_nomina, :preguntaSecreta, :contrase��a, :id_contrato)
    end
end
