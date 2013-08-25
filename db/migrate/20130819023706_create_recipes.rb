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
      t.text :from_kitchen
			t.boolean :quickneasy
			t.boolean :leftovers
			t.boolean :kidfav
			t.boolean :xmas
			t.boolean :grill
			t.boolean :turkey
			t.boolean :lite
			t.boolean :summer
      t.references :user, index: true

      t.timestamps
    end
  end
end
