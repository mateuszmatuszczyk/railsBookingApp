class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :service_description
      t.integer :service_duration
      t.decimal :service_price
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
