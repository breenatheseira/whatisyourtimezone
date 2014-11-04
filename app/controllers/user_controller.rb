class UserController < ApplicationController
    def index
        @user = User.all()
    end
    
    #for new user (sign up), but GET action
    def new
        @user = User.new()
    end
    
    #for new user (sign up), but POST action
    def create
        @user = User.new(user_params)
        
        if @user.save
            #success message; be sure to add in confirmation email next time.
            redirect_to user_index_path, notice: "You have successfully signed up!"
        else
            #invalid input message
            redirect_to new_user_path, alert: "Invalid input! Please try again!"
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
