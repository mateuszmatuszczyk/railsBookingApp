class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :customer_name
      t.string :customer_number
      t.string :customer_photo_path
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
