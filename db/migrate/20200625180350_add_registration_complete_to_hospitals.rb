class AddRegistrationCompleteToHospitals < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :registration_complete, :boolean
  end
end
