class UsersController < ApplicationController
#Login de Empresa
  def index
    render "indexcompany"
end
#Cargar vista Prestamos
def loan
  render 'loan', layout: 'home'
 end
   #carga vista Empleado
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
     user = User.select('id_perfi,id').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
    
     user_session = User.select('nombre ').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
     user_sessionA = User.select('apellido').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
    
     session[:user] = user_session.nombre 
     session[:userA] = user_sessionA.apellido

     
     session[:datos] = User.select('U.id, U.nombre, U.apellido, C.salario, C.cargo, C.tipo_contrato, C.fecha_ingreso, C.fecha_retiro, E.nombre').joins(' U JOIN "Web"."tbContratos" C ON C.id = U.id_contrato JOIN  "Web"."tbEmpresa" E ON E.id = U.id_empresa JOIN "Web"."tbUsuarios"
     ON U.id =' << user.id.to_s).first
        
     #session[:datos]["id"]
     #session[:datos]["cargo"]

     if user.id_perfi.eql?(1)
         render 'company', layout: 'homeEmpresa'
     else
         render 'employee', layout: 'home'
     end
   else 
       @mensaje = 'usuario y contraseña incorrecta'
       @tipo ='error'
       render 'indexcompany'
   end
 end
       

          def Index
            render 'index'
          end

          def register
            @perfiles=Profile.all
            render 'register'
          end

          def edit
           render 'edit'
          end

          def show
            redirect_to :action => 'export' 
           end

          #def profile
            #render 'profiles', layout: 'homeEmpresa'
          #end

          
end

