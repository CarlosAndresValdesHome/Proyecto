class UsersController < ApplicationController

#Login de Empresa
  def index
    #Login de Empresa
    render "indexcompany"
  end


  if id = nil 
     @usercontra = session[:usercontra]
     @usercontra.update(:contrasena=>params[:txtNuevaContra])
     User.update(session[:usercontra])
    
     render "employee", layout: 'home'
    
  end
  
#Cargar vista Prestamos
 def loan
  if params[:txtvalorsolicitar] != nil and params[:txtNumeroCuotas] != nil
     neto = params[:txtvalorsolicitar].to_f / params[:txtNumeroCuotas].to_f
     totalp = neto * 0.02
     total = neto + totalp
     @total = total
     @valorSolicitado =  params[:txtvalorsolicitar]
     @numeroCuotas = params[:txtNumeroCuotas]
     render "show"
  end

 end


   #carga vista Empleado
 def employee
    render "employee", layout: 'home'
 end
 #carga la vista de empresa y se integra al layout de empresas
  def company
   render 'company', layout: 'homeEmpresa'
  end

#carga la vista de lagin
def Login
       redirect_to :controller => 'users', :action => 'login' 
end
#valida en la base de datos si el  usuario y contraseña existen
def login
   
if User.exists?(:email=>params[:txtUser],:id=>params[:txtPassword])
 render 'employee'
 
 else 
   @mensaje = 'usuario y contraseña incorrecta'
   @tipo ='error'
   render 'index'
 end

end
#realiza las consultas en la base de datos y trae informacion para ingresar a los modulos segun su perfil
 def loginEmpresa      
   if User.exists?(:email=>params[:txtUser],:id=>params[:txtPassword])
     user = User.select('id_perfi,id').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
    
     user_session = User.select('nombre').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
     user_sessionA = User.select('apellido').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
         userContra = User.select('contrasena').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
   
     session[:nombre] = user_session.nombre 
     session[:apellido] = user_sessionA.apellido
         session[:usercontra] = userContra

     

     
     session[:datos] = User.select('U.id, U.nombre, U.apellido, C.salario, C.cargo, C.tipo_contrato, C.fecha_ingreso, C.fecha_retiro, E.id as "nit", E.nombre').joins(' U JOIN "Web"."tbContratos" C ON C.id = U.id_contrato JOIN  "Web"."tbEmpresa" E ON E.id = U.id_empresa JOIN "Web"."tbUsuarios"
     ON U.id =' << user.id.to_s).first
        
     session[:datosNomina] = Paysheet.select('N.dias_laborados, N.neto_pagado, N.id, N.comisiones, N.auxilio_trasporte, N.recargos,N.prima, N.prestamos, N.salud, N.pension').joins(' N JOIN "Web"."tbUsuarios" U ON U.id =' << user.id.to_s)


    
        if user.id.eql?(params[:txtPassword].to_i)
         render 'cambiocontr'
        else
          if user.id_perfi.eql?(1)
         render 'company', layout: 'homeEmpresa'
     else
         render 'employee', layout: 'home'
     end
        end
   else 
        @mensaje = 'usuario y contraseña incorrecta'
       @tipo ='error'
        render 'indexcompany'
   end
 end

    #grava registros de perfiles   
def save_register
  @perfiles = Profile.all
        mensaje = ""
        if params[:txtLogin].strip.empty? 
            mensaje += "Ingrese Login,"
        end
        if params[:ddlPerfiles].empty? 
            mensaje += "Seleccione Perfil,"
        end
        if params[:txtPassword].strip.empty? 
            mensaje += "Ingrese Password,"
        end
        if !params[:txtPassword].strip.eql?(params[:txtConfirmarPassword].strip) 
            mensaje += "Password no coincide,"
        end
                
        #Si el  mensaje es diferente de vacío, contiene log de errores
        if !mensaje.eql?("")
            @mensaje = mensaje.slide 0..-2
            @tipo = 'error' 
              return
        end

        #Dos formas de recuperar el id máximo y de sumarle 1 a ese valor máximo
        #user_search = user.order_by("id").last
        #id = user_search.id + 1
        id = User.maximum('id') + 1
            
        #Instanciamos un nuevo objeto de User y lo nombramos user
        user = User.new
        user.id = id
        user.Login = params[:txtLogin]
        user.Password = params[:txtPassword]
        user.pelfil_id = params[:ddlPerfiles]
  @user = User.new(user_params)

  respond_to do |format|
    if @user.save
      NotifyMailer.send_mail(params[:txtLogin],'Creación de cuenta',user).deliver
      render json: {status: "ok", mensaje: 'Se realizó proceso con éxito', tipo: 'success'}
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      render json: {status: "ok", mensaje: 'Hubo un error durante el procedimiento', tipo: 'error'}
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
    
    
end

#realiza un render a index
          def Index
            render 'index'
          end

          def register
            @perfiles=Profile.all
            render 'register'
          end
#edita datos de perfiles
          def edit
           render 'edit'
          end
#direcciona a la vvista show donde esta el simulador de creditos
          def show
            render 'show', layout: 'home'
          end
  
        
  
            
end
end


