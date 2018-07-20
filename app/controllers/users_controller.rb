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
                  
        
            def indexcompany
              render "indexcompany"
            end

            def home 
              render 'homes' 
          end

          def Index
            render 'index'
          end
<<<<<<< HEAD
          def profile
            render 'profiles', layout: 'homeEmpresa'
          end
=======
>>>>>>> 6b57d416a54154cc86dc27cd83229299a5c82b9f

        

end


