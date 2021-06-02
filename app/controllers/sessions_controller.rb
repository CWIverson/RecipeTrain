class SessionsController < ApplicationController
    def new

    end

    def create
        user=User.find_by(username: params[:username]) 
        if user&&user.authenticate(params[:password])
            session[:user_id]=user.id
            redirect_to '/'
        else
            render 'sessions/new'
        end

    end
    def destroy
        reset_session
        redirect_to login_path
    end

    def omniauth
        
       user=User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(16)
        end

        if user.valid?
            redirect_to '/'
        else
            print "fail"
        end
    end

    private
    def auth
        request.env['omniauth.auth']
    end

end