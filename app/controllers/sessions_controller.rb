class SessionsController < ApplicationController
    include SessionsHelper
    
    def new
    end
    
    def create
        @user = User.find_by(email: params[:session][:email])
        #User.find_by()
        
        if @user and @user.authenticate(params[:session][:password])
            #true, user exists
            
            #saves session of user_id
            session[:user_id] = @user.id
            #zxc not passing value of the session into the path
            redirect_to user_path(current_user), notice: "You have successfully logged in."
        else
            #false, user exist, wrong email/password
            flash.now[:alert]  = "Oops! Your email/password is wrong! Please try again."
            render 'new'
        end
    end
    
    def destroy
        session.delete(:user_id)
        redirect_to root_path, notice: "You have logged out."
    end
    
end
