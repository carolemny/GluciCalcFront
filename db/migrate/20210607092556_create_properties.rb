class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
