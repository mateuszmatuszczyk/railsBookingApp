json.extract! barber, :id, :barber_name, :barber_bio, :barber_photo_path, :created_at, :updated_at
json.url barber_url(barber, format: :json)
