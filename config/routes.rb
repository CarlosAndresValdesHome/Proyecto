Rails.application.routes.draw do
  resources :paysheets
  resources :contract_profiles
  resources :contracts
  resources :users
  resources :companies
  resources :charge_profiles
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "users" => "users#index"   #crea un alias y con la asignacion indico controlador y accion

get "users/Login"   #indico directo el controlador y la accion
get "homes" => "users#homes"  
get "registro" => "users#registro" 
get "users/homes" 
get "users/Index"
get "users/employee"
post "employee" => "users#employee"
get "users/login"
post "/users/Login"  => "users#login" 
get "users/loan"  
post "users/loan" => "users#loan" 
get "users/indexcompany" => "users#indexcompany" 
post "users/loginEmpresa" => "users#loginEmpresa" 
get "users/company" 
get "/users/registro" 

end

