class RecipesController < ApplicationController
    def index
        
        @recipes = Recipe.all
        
    end
    def show
        @recipe= Recipe.find(params[:id])

    end
    
    def new
        # binding.pry
        user_id = session[:user_id]
        user = User.find(user_id) 
        #find_user
        3.times do
        @recipe = user.recipes.build
        end
    end

    def create
        
        user_id = session[:user_id]
        user = User.find(user_id) 
             
        #@recipe = Recipe.create(recipe_params.merge(:user_id=>user_id))
        @recipe = user.recipes.build(recipe_params)

        if @recipe.save
            if user
                redirect_to  new_recipe_recipe_ingredient_path(@recipe)
            end
        else
            # flash[:errors]=@recipe.errors.full_messages
            flash.now.alert = @recipe.errors.full_messages

            render :new
        end  
    end

    def destroy

    end

    def update

    end

    private
    def find_recipe
        @recipe = Recipe.find_by_id(params[:id])
    end
    def recipe_params
        params.require(:recipe).permit(:name, :user_id)
    end 
    def find_user
        @user = User.find_by_id(params[:user_id])
    end

end
