json.extract! appointment, :id, :appointment_time, :appointment_date, :appointment_duration, :total_cost, :status, :customer_id, :barber_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
