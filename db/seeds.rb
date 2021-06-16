require 'faker'

User.destroy_all
Food.destroy_all
Meal.destroy_all
Quantity.destroy_all
Comment.destroy_all
Favorite.destroy_all

# USER
5.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Name.first_name + "@yopmail.com",
    password: "azerty",
  )
  puts "Create User"
end

# FOOD
10.times do
  food = Food.create!(
    api_product_id: "3270160235322",
    name: Faker::Food.dish,
    category:[0,1].sample,
    description: Faker::Food.description,
    duration: 10,
  )
  puts "Create Food"
end

# MEAL
10.times do
  meal = Meal.create!(
    name: ["petit-déjeuner", "déjeuner", "diner"].sample,
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user: User.all.sample,
  )
  puts "Create Meal"
end

# QUANTITY PRODUCT
10.times do
  quantityProduct = Quantity.create!(
    quantity: Faker::Number.number(digits: 3),
    carbs_per_100g: Faker::Number.number(digits: 3),
    meal: Meal.all.sample,
    product: Food.where(category: 1).sample,
  )
  puts "Create QuantityProduct"
end

# QUANTITY RECIPE
10.times do
  quantityRecipe = Quantity.create!(
    quantity: Faker::Number.number(digits: 3),
    carbs_per_100g: Faker::Number.number(digits: 3),
    meal: Meal.all.sample,
    recipe: Food.where(category: 0).sample,
  )
  puts "Create QuantityRecipe"
end

# COMMENT
10.times do
  comment = Comment.create!(
    content: Faker::Food.description,
    user: User.all.sample,
    recipe: Food.where(category: 0).sample,
  )
  puts "Create Comment"
end

# FAVORITE
10.times do
  favorite = Favorite.create!(
    user: User.all.sample,
    recipe: Food.where(category: 0).sample,
  )
  puts "Create Favorite"
end


