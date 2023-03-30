require_relative "../lib/recipe_repository"


RSpec.describe RecipeRepository do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname:  'recipe_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_recipes_table
  end

  it "returns a list of recipes" do
    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes.length).to eq(2)
    expect(recipes[0].id).to eq("1")
    expect(recipes[0].name).to eq('Soup')
    expect(recipes[0].cooking_time).to eq('30') 
    expect(recipes[0].rating).to eq('2')
  end

  it "returns one recipe" do
    repo = RecipeRepository.new
    recipe = repo.find(2)

    expect(recipe.id).to eq('2')
    expect(recipe.name).to eq('Pizza')
    expect(recipe.cooking_time).to eq('25') 
    expect(recipe.rating).to eq('5')
  end

end