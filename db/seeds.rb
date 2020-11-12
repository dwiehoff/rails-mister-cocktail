require 'open-uri'
require 'json'

Cocktail.destroy_all
Ingredient.destroy_all

Ingredient.create(name: 'ice')
Ingredient.create(name: 'mint leaves')

str = URI.open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
hash = JSON.parse(str)['drinks']
# [{"strIngredient1":"Light rum"},{"strIngredient1":"Applejack"}, ...]
hash.each do |el|
  Ingredient.create(name: el['strIngredient1'])
end
puts "» Created ingredients from JSON"

Cocktail.create!(name: "Sex on the Beach")
Cocktail.create!(name: "Green Eyes")
Cocktail.create!(name: "Motherf*cker")
Cocktail.create!(name: "Screwdriver")

# Dose.create!(description: '2 cl', ingredient_id: 54, cocktail_id: 10)
