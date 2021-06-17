class CreateQuantities < ActiveRecord::Migration[6.1]
  def change
    create_table :quantities do |t|
      t.float :quantity
      t.float :carbs_per_100g
      t.belongs_to :meal, index: true
      t.references :product, index: true
      t.references :recipe, index: true
      

      t.timestamps
    end
  end
end
