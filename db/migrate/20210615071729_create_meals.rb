class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :type
      t.datetime :date
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
