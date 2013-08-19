class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :oven_temp
      t.string :cook_time
      t.integer :calories
      t.references :category, index: true
      t.text :instructions
      t.text :notes
      t.references :user, index: true

      t.timestamps
    end
  end
end
