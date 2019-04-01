json.extract! customer, :id, :customer_name, :customer_number, :customer_photo_path, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
