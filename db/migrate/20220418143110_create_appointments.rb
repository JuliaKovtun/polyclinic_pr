class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :doctor, foreign_key:true
      t.text :comment
      t.datetime :date
      t.timestamps
    end
  end
end
