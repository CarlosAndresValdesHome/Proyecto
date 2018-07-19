json.extract! user, :id, :id, :nombre, :apellido, :direccion, :telefono, :email, :id_empresa, :id_perfi, :id_perfil_cargo, :id_nomina, :created_at, :updated_at
json.url user_url(user, format: :json)
