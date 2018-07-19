class UsersController < ApplicationController

    def index
        render "index"
    end

    def employee
        render "employee"
    end


    def Login
            redirect_to :controller => 'users', :action => 'login' 
     end
    
    def login
        
     if User.exists?(:email=>params[:txtUser],:id=>params[:txtPassword])
       
        
       render 'employee'
       
      else 
        @mensaje = 'usuario y contraseña incorrecta'
        @tipo ='error'
        render 'index'
       end

     end

      def loginEmpresa
        
                if User.exists?(:email=>params[:txtUser],:id=>params[:txtPassword])
                user = User.select('id_perfi').where(:email=>params[:txtUser],:id=>params[:txtPassword])
                if user.id_perfi == 1
                    render 'company'

                    elsif user == 2
                        render 'employee'
                    end

                    else 
                        @mensaje = 'usuario y contraseña incorrecta'
                        @tipo ='error'
                        render 'indexcompany'
                    end
              end
            
   
      def indexcompany
        render "indexcompany"
      end

      def home 
        render 'homes' 
        
      end

     def Index
       
        render 'index'
     end
     
     def loan
       
        render 'loan'
     end

    # def register
    #     @perfiles = Profile.all
    #     render 'register'
    # end
    # def save_register
    #     mensaje = ""
    #     if !params.presence?(params[:txtLogin]) mensaje += "Ingrese Login \n,"
    #     if params[:txtLogin].eql?("") mensaje += "Ingrese Login,"
    #     if params[:ddlPerfil].eql?("") mensaje += "Seleccione Perfil,"
    #     if params[:txtPassword].eql?("") mensaje += "Ingrese Password,"
    #     if !params[:txtPassword].eql?(params[:txtConfirmarPassword]) mensaje += "Password no coincide"

    #     user_search = user.order_by("id").last
    #     id = user_search.id + 1

    #     user = User.new
    #     user.id = id
    #     user.Login = params[:txtLogin]
    #     user.Password = params[:txtPassword]
    #     user.pelfil_id = params[:ddlPerfil]
    #     if user.save?
            
    #     else
        
    #     end
    #end
    #end
end

