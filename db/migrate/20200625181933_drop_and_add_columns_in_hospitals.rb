class DropAndAddColumnsInHospitals < ActiveRecord::Migration[6.0]
  def change
    remove_column :hospitals, :registration_done
    add_column :hospitals, :registration_completed, :boolean, default: true
  end
end
