class UsersController < ApplicationController
#Login de Empresa
  def index
    render "indexcompany"
  end


#Cargar vista Prestamos
 def loan
  #if (:valorSolicitar=>params[:txtvalorsolicitar],or :numeroCuotas=>params[:txtNumeroCuotas])!= nil
     #neto = valorSolicitar/numeroCuotas
     #total = neto *0.05
     #@total = total
  #end

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

     
     session[:datos] = User.select('U.id, U.nombre, U.apellido, C.salario, C.cargo, C.tipo_contrato, C.fecha_ingreso, C.fecha_retiro, E.id as nit, E.nombre').joins(' U JOIN "Web"."tbContratos" C ON C.id = U.id_contrato JOIN  "Web"."tbEmpresa" E ON E.id = U.id_empresa JOIN "Web"."tbUsuarios"
     ON U.id =' << user.id.to_s).first
        
     #session[:datosNomina] = Paysheet.select('N.dias_laborados, N.neto_pagado, N.id, N.comisiones, N.auxilio_trasporte, N.recargos,N.prima, N.prestamos, N.salud, N.pension').joins(' N JOIN "Web"."tbUsuarios" U ON U.id =' << user.id.to_s).first

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
            render 'show', layout: 'home'
           end

          #def profile
            #render 'profiles', layout: 'homeEmpresa'
          #end

          
end



