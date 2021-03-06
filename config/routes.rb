Rails.application.routes.draw do
  resources :user_modifieds
  resources :paysheets
  resources :contract_profiles
  resources :contracts
  resources :users
  resources :companies
  resources :charge_profiles
  resources :profiles
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "users" => "users#index"   
get "users/Login"   
get "homes" => "users#homes"  
get "register" => "users#register" 
get "users/homes" 
get "users/Index"
get "users/employee"
post "employee" => "users#employee"
get "users/login"
post "/users/Login"  => "users#login" 
get "/users/loan"  => "users#loan" 

get "users/indexcompany" => "users#indexcompany" 
post "users/loginEmpresa" => "users#loginEmpresa"
get "users/company" 
get "register" => "users#save_register"
post "users/save_register"
post "users/save_edit"
get "edit" => "users#register"
get "reports/export"
get "reports/paysheet"
get "users/show"
post "/users/loan" => "users#loan"
get "/charge_profiles/index"
get "/user_modifieds/index" => "user_modifieds#index" 
get "/companies/index"
get "/contract_profiles/index"
get "/contracts/index"
end

