class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
    has_many :recipes, through: :recipe_ingredients   
    validates_presence_of :name
    validates_uniqueness_of :name

    scope :sort_ingredients, -> { order("name") }
end
