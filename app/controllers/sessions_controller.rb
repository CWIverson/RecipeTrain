class SessionsController < ApplicationController
    def new

    end

    def create
        # u = User.find_by_email(params[:email])
        # if u && u.authenticate(params[:password])
        #     session[:user_id] = u.id
        #     redirect_to user_path(u)
        # else
        #     #flash[:errors]= ['Username or Password is Incorrect']
        #     flash.now.alert =["Username or password is incorrect"]
        #     render 'sessions/new'
        # end
        user=User.find_by(username: params[:username]) 
        # byebug
        if user&&user.authenticate(params[:password])
            session[:user_id]=user.id
            redirect_to '/'
        else
            # flash[:errors]= ['Username or Password is Incorrect']
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
        #byebug
        if user.valid?
            session[:user_id] = user.id
            redirect_to '/'
        else
           # flash[:message] = user.errors.full_messages.join(", ")
            redirect_to new_user_path
        end
      
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end