class AddStateToHospital < ActiveRecord::Migration[6.0]
  def change
    add_column :hospitals, :state, :string
  end
end
