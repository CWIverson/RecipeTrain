class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients  
    validates_presence_of :name
    validates_uniqueness_of :name
end
