class SessionsController < ApplicationController
    def new

    end

    def create
        user=User.find_by(username: params[:username]) 
        if user&&user.authenticate(params[:password])
            session[:user_id]=user.id
            redirect_to '/'
        else
            flash.now.alert =["Username or password is incorrect"]
            render 'sessions/new'
        end
        
    end

    def destroy
        reset_session
        redirect_to login_path
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to '/'
        else
            redirect_to new_user_path
        end
      
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end