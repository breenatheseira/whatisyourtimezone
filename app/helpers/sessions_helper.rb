module SessionsHelper
    
    def current_user
        #????
        @current_user = User.find(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        #logged_in? If current_user.nil is true, then no, else, yes (so, !)
        !current_user.nil?
    end 
end
