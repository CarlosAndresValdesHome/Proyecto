json.extract! user_modified, :id, :id, :nombre, :apellido, :direccion, :telefono, :email, :id_empresa, :id_perfil, :id_perfil_cargo, :id_nomina, :preguntaSecreta, :contrase«Òa, :id_contrato, :created_at, :updated_at
json.url user_modified_url(user_modified, format: :json)
