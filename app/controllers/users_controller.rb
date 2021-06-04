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
            #flash.now.alert = @user.errors.full_messages

            render new_user_path
        end
    end
    def show
        @user = User.find(session[:user_id])
    end

    def update

    end

    def destroy
        find_user
        @user.destroy
        session.destroy
        redirect_to login_path
    end

    private
    def find_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
