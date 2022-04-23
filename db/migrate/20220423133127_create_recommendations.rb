class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.references :appointment, foreign_key: true
      t.text :recommendation
      t.timestamps
    end
  end
end
