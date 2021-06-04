class RecipeIngredientsController < ApplicationController
    def index
        @recipe_ingredient = RecipeIngredient.all

    end
    def new
        @recipe_ingredient = RecipeIngredient.new
    end

    def create
        # recipe_id = Recipe.
        # user = User.find(user_id) 
        @recipe_ingredient = Recipe.recipe_ingredients.build(recipe_ingredient_params)
       if @recipe_ingredient.save
           redirect_to recipe_ingredients_path
       else
          
           flash.now.alert = @recipe_ingredient.errors.full_messages

           render :new
       end  
   end

   private
   def find_recipe_ingredient
    @recipe_ingredient = RecipeIngredients.find_by_id(params[:id])
   end
   def recipe_ingredient_params 
    params.require(:recipe_ingredients).permit(:recipe_id, :instructions, :ingredient_id)

   end
end