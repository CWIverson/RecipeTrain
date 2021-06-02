class UsersController < ApplicationController
    def new
        @user=User.new
    end
    def create
        @user=User.create(user_params)
        if @user.valid?

            session[:user_id]=@user.id
             redirect_to '/'
        else
            flash[:errors]=@user.errors.full_messages
            render new_user_path
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
