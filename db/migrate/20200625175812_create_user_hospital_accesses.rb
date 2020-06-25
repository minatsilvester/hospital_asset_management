class CreateUserHospitalAccesses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_hospital_accesses do |t|
      t.references :hospital, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :access_type

      t.timestamps
    end
  end
end
