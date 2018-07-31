json.extract! user_modified, :id, :name, :created_at, :updated_at
json.url user_modified_url(user_modified, format: :json)
