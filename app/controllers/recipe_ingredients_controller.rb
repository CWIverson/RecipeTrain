class RecipeIngredientsController < ApplicationController
    def index
        @recipe_ingredient = RecipeIngredient.all

    end
    def new
        url = request.original_url.split('/')
         recipe_id = url[4].to_i
         recipe = Recipe.find(recipe_id)
        @recipe_ingredient = RecipeIngredient.new
    end

    def create
        url = request.original_url.split('/')

        recipe_id = url[4].to_i

        recipe = Recipe.find(recipe_id)
       
        @recipe_ingredient = recipe.recipe_ingredients.build(recipe_ingredient_params)

       if @recipe_ingredient.save
            
           redirect_to recipe_recipe_ingredients_path
       else
          
           flash.now.alert = @recipe_ingredient.errors.full_messages

           render :new
       end  
   end

   private

   def instruction
    recipe_ingredient_params[:instruction]
   end

   def find_recipe_ingredient
    
    @recipe_ingredient = RecipeIngredients.find_by_id(params[:id])
   end

   def recipe_ingredient_params 

    params.require(:recipe_ingredient).permit(:recipe_id, :instruction, :ingredient_id)
   end
end