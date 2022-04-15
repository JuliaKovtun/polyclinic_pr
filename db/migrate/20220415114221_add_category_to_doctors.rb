class AddCategoryToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_reference :doctors, :category
  end
end
