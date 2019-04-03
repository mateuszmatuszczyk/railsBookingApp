class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.time :appointment_time, null: false
      t.date :appointment_date, null: false
      t.integer :appointment_duration, null: false, default: 0
      t.decimal :total_cost, null: false, default: 0.0
      t.string :status, null: false, default: "active"
      t.references :customer, foreign_key: true
      t.references :barber, foreign_key: true

      t.timestamps
    end
  end
end
