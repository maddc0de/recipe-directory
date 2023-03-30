require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

DatabaseConnection.connect('recipe_directory')

repo = RecipeRepository.new

# prints a list of recipes
repo.all.each do |recipe|
  puts "#{recipe.id}. #{recipe.name}, cooking time:#{recipe.cooking_time} rating:#{recipe.rating}"
end

recipe = repo.find(1)
puts "recipe with id = 1 is: #{recipe.name}"