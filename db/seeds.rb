require 'open-uri'
require 'json'

Ingredient.create(name: 'ice')
Ingredient.create(name: 'mint leaves')

str = URI.open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
hash = JSON.parse(str)['drinks']
# [{"strIngredient1":"Light rum"},{"strIngredient1":"Applejack"}, ...]
hash.each do |el|
  Ingredient.create(name: el['strIngredient1'])
end
puts "» Created ingredients from JSON"
