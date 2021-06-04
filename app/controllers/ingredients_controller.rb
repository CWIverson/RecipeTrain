class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
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
    def add_to_recipe
        join=Recipe_Ingredients(params[:id].merge) 
    end

    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end
end
