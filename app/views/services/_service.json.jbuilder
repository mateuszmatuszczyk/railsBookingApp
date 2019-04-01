json.extract! service, :id, :service_name, :service_description, :service_duration, :service_price, :appointment_id, :created_at, :updated_at
json.url service_url(service, format: :json)
