class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, index: true
      t.references :recipe, index: true
      t.timestamps
    end
  end
end
