class AddForeignKeyToDoctor < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :doctors, :categories
  end
end
