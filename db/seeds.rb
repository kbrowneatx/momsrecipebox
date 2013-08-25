# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# populate Category list
cat_list = [
	'Appetizers & Beverages',
	'Eggs & Dairy',
	'Soups & Salads',
	'Vegetables & Sides',
	'Meats',
	'Poultry',
	'Seafood',
	'Pastas & Casseroles',
	'Breads, Rolls & Pastries',
	'Cakes, Cookies & Desserts'
]

cat_list.each do |name|
  Category.create!(name: name)
end


recipe_list = [
	["Best Roast Beef","5","5 min per lb","500","325","Soften butter, mix with salt, pepper, onion powder and garlic powder. Spread mixture liberally over the roast. Place roast in shallow baking pan. Roast at 350 for 20 minutes per pound. Let roast stand for 10 minutes before slicing.","Turn down oven to 200 after 5xlbs. Best dinner ever","1"],
	["Cranberry-Apple Bake","4","45 min","325","400","Dice apples. Mix with cranberries and sugar. Pour in baking dish. Mix butter, oats, brown sugar, flour. Spread over fruit. Bake.","Awesome with vanilla ice cream","1"]
]

recipe_list.each do |name,cat_id,time,temp,cals,instructions,notes,user_id|
  Recipe.create!(name: name, category_id: cat_id, cook_time: time, oven_temp: temp, calories: cals, instructions: instructions, notes: notes, user_id: user_id)
end

ingr_list = [
	["Beef tenderloin, 1/2 lb uncooked per person","1"],
	["1 tbsp Coarse ground salt","1"],
	["1 tbsp Coarse ground black pepper","1"],
	["1 stick butter, softened","1"],
	["1/2 tbsp onion powder","1"],
	["1/2 tbsp garlic powder","1"],
	["2 apples, granny smith or honeycrisp, diced", "2"],
	["2 cups fresh cranberries", "2"],
	["1 cup sugar", "2"],
	["1 cup quick-cooking oats", "2"],
	["1/2 cup brown sugar", "2"],
	["1/3 cup flour", "2"],
	["1 stick butter", "2"]
]

ingr_list.each do |name, rec_id|
  Ingredient.create!(name: name, recipe_id: rec_id)
end

