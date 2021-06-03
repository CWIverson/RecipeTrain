class RecipesController < ApplicationController
    def index
        
        @recipes = Recipe.all
        
    end
    def show
        @recipe= Recipe.find(params[:id])

    end
    
    def new
        user_id = session[:user_id]
        user = User.find(user_id) 
        #find_user
        @recipe = user.recipes.build
        
    end

    def create
        
        user_id = session[:user_id]
        user = User.find(user_id) 
             
            @recipe = Recipe.create(recipe_params.merge(:user_id=>user_id))
        

        if @recipe.save
            if user
                redirect_to recipes_path   
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
