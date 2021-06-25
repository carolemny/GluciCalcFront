require 'faker'

User.destroy_all
Food.destroy_all
Meal.destroy_all
Quantity.destroy_all
Comment.destroy_all
Favorite.destroy_all

data = [["Muesli Raisin, Figue, Abricot", "3229820129488"],
        ["Prince Chocolat", "7622210449283"],
        ["Barilla pates collezione lasagnes aux oeufs", "8076800376999"],
        ["Pur beurre de cacahuète", "3760020507350"],
        ["Croissants", "3256540000339"],
        ["Pizza Végétale", "4001724819905"],
        ["alpro Nature à la noix de coco", "5411188119098"],
        ["Sardines à l'huile d'olive", "3019081238643"],
        ["Hachis parmentier", "3248830723431"],
        ["Sucre en poudre", "3165433710005"],
      ]

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

# FOOD RECIPE
10.times do
  foodRecipe = Food.create!(
    api_product_id: "3270160235322",
    name: Faker::Food.dish,
    category:0,
    description: Faker::Food.description,
    duration: 10,
  )
  puts "Create Food Recipe"
end

# FOOD PRODUCT
50.times do
  productData = data.sample
  foodProduct = Food.create!(
    api_product_id: productData[1],
    name: productData[0],
    category:1,
  )
  puts "Create Food Product"
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
    quantity: Faker::Number.number(digits: 2),
    carbs_per_100g: Faker::Number.number(digits: 2),
    meal: Meal.all.sample,
    product: Food.where(category: 1).sample,
  )
  puts "Create QuantityProduct"
end

# QUANTITY RECIPE
10.times do
  quantityRecipe = Quantity.create!(
    quantity: Faker::Number.number(digits: 2),
    carbs_per_100g: Faker::Number.number(digits: 2),
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

# ADMIN

1.times do
  userAdmin = User.create!(
    first_name: "Admin",
    last_name: "Glucicalc",
    email: "glucicalcadmin@yopmail.com",
    password: "azerty",
  )
  puts "Create Admin"
end

# MEAL ADMIN
50.times do
  mealAdmin = Meal.create!(
    name: ["petit-déjeuner", "déjeuner", "diner"].sample,
    date: Faker::Date.between(from: 2.months.ago, to: Date.today),
    user: User.last,
  )
  puts "Create Meal Admin"
end

# QUANTITY PRODUCT ADMIN
50.times do
  quantityProductAdmin = Quantity.create!(
    quantity: Faker::Number.number(digits: 2),
    carbs_per_100g: Faker::Number.number(digits: 2),
    meal: Meal.where(user_id: User.last).sample,
    product: Food.where(category: 1).sample,
  )
  puts "Create QuantityProduct Admin"
end