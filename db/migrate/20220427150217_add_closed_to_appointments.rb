class AddClosedToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :closed, :boolean, default: false
  end
end
