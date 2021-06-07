class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.sort_ingredients
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
         @ingredient = Ingredient.create(ingredient_params)

        if @ingredient.save
            
            redirect_to ingredients_path
        else
            flash.now.alert = @ingredient.errors.full_messages

            render :new
        end  

    end
    
    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
