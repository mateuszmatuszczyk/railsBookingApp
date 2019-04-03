class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :service_name, null: false, default: ""
      t.string :service_description, null: false, default: ""
      t.integer :service_duration, null: false, default:0
      t.decimal :service_price, null: false, default:0.0
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
