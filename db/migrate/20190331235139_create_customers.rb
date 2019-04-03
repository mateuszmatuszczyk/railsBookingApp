class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :customer_name, null: false, default: ""
      t.string :customer_number, null: false, default: ""
      t.string :customer_photo_path, null: false, default: "blank"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
