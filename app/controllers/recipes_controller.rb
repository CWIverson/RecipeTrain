class RecipesController < ApplicationController
    def index
        if params[:user_id] 
            find_user
     
            @recipes = @user.recipes
        else
            @recipes = Recipe.all
          
         end

    end
    
    def new
        if params[:user_id]  # Making a New Outfit Associated with a User
            find_user
            @outfit = @user.recipes.build
        end

    end

    def create
        if params[:user_id]
            find_user
            @recipe = @user.recipe.build(recipe_params)    #build out an outfit ;D
        else
            @recipe = Recipe.new(recipe_params)
        end

        if @recipe.save
            if @user
                redirect_to user_recipe_path(@user, @recipe)   
            end
        else
            render :new
        end
        
    end
    private
    def find_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end
    def recipe_params
        params.require(:recipe).permit(:name, :instructions, :user_id)
    end 
    def find_user
        @user = User.find_by_id(params[:user_id])
    end

end
