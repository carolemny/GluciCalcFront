class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
