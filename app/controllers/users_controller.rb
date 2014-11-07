class UsersController < ApplicationController
    
    include SessionsHelper
    
    def index
        @user = User.all()
    end
    
    #for new user (sign up), but GET action
    def new
        @user = User.new()
        #in order to ensure that the profile and user is tied together
        @user.build_profile
    end
    
    #for new user (sign up), but POST action
    def create
        @user = User.new(user_params)
        
        if @user.save
            #success message; be sure to add in confirmation email next time.
            UserMailer.welcome_email(@user).deliver
            flash[:notice] = "You have successfully signed up!" 
            redirect_to root_path
        else
            #invalid input message
            # wont use redirect_to, so that it will retan
            render 'new', alert: "Invalid input! Please try again!"
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        
        if @user.update_attributes(user_params)
            redirect_to user_path, notice: "Profile Details Updated Successfully! "
        else
            redirect_to edit_user_path(@user), alert: "Oh snap! Invalid input!"
        end
    end
    
    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, profile_attributes: [:birthdate, :location])
    end
end
