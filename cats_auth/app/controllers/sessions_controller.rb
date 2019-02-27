class SessionsController < ApplicationController
    before_action :ensure_logged_in
    def new
        render :new
    end
    
    def create
        user = User.find_by_credentials(*params[:user].values)
        if user 
           login_user!(user) #log in user
            redirect_to cats_url
        else
            flash[:errors] = ["Invalid username/password"]
            redirect_to new_sessions_url
        end
    end

    def destroy
        logout!
        redirect_to new_sessions_url
    end
end