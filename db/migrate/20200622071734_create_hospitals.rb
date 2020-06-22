class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :primary_email
      t.string :country
      t.string :city
      t.text :address
      t.string :phone

      t.timestamps
    end
    add_index :hospitals, :primary_email, unique: true
  end
end
