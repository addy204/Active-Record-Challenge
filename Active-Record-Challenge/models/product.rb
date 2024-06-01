# Author Aditya Sharma
# Course WEBD-3011 (255576) Agile Full Stack Web Development
# Version 1.0
# Discription Add validation specific to requirements
# show the relative data in the table as a comment
class Product < ActiveRecord::Base
  # This AR object is linked with the products table.

  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a *category*.
  belongs_to :category
  # Columns in the products table are id, name, description, price, stock_quantity, category_id, created_at, updated_at
  # validates all colums except for fk, id, and datetime to ensure its filled out before submission
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, :price, :stock_quantity, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
