class UsersController < ApplicationController

  def index
    render "indexcompany"
end

def loan
  render 'loan', layout: 'home'
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
     user = User.select('id_perfi').where(:email=>params[:txtUser],:id=>params[:txtPassword]).first
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
       

<<<<<<< HEAD
 def indexcompany
   render "indexcompany"
 end

 def home 
   render 'homes' 
end

def Index
 render 'index'
end
    
def profile
 render 'profiles', layout: 'homeEmpresa'
         
end
=======
          def Index
            render 'index'
          end
>>>>>>> d52723233dd33735ebe6ec4c5b9718a5af20f468

          #def profile
            #render 'profiles', layout: 'homeEmpresa'
          #end
end


