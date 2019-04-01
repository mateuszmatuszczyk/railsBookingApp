class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.time :appointment_time
      t.date :appointment_date
      t.integer :appointment_duration
      t.decimal :total_cost
      t.string :status
      t.references :customer, foreign_key: true
      t.references :barber, foreign_key: true

      t.timestamps
    end
  end
end
