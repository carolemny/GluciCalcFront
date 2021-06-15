class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :api_product_id
      t.string :name
      t.integer :type
      t.string :description
      t.float :duration

      t.timestamps
    end
  end
end
