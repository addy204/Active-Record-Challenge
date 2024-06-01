# Author Aditya Sharma
# Course WEBD-3011 (255576) Agile Full Stack Web Development
# Version 1.0
# Discription creates 10 catagories with 10 products with reqire colums
# specific to food
require_relative 'ar.rb'
require 'faker'

# Ensure that Faker is configured to generate data in English
Faker::Config.locale = 'en'

# Generate 10 new food-related categories
10.times do
  # Create a new category with a unique food-related name
  category = Category.create(name: Faker::Food.unique.ingredient)

  # Generate 10 new products for each category
  10.times do
    category.products.create(
      name: Faker::Food.dish,
      description: Faker::Food.description,
      price: Faker::Commerce.price(range: 0.01..100.0),
      stock_quantity: Faker::Number.between(from: 1, to: 100)
    )
  end
end

puts "10 new food-related categories and 100 new products have been generated."
