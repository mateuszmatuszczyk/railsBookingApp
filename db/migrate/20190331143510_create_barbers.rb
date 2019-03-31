class CreateBarbers < ActiveRecord::Migration[5.2]
  def change
    create_table :barbers do |t|
      t.string :barber_name
      t.string :barber_bio
      t.string :barber_photo_path
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
