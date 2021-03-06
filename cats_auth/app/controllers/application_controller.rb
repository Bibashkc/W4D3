class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token
        session[:session_token] = nil
    end

    def login_user!(user)
        session[:session_token] =  user.reset_session_token
    end

    def ensure_logged_in
        redirect_to cats_url unless logged_in?
    end

end
