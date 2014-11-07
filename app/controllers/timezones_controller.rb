class TimezonesController < ApplicationController
    
    include SessionsHelper
    
    def index
        @user = User.find(params[:user_id])
        @timezone = Timezone.new()
        @timezone = @user.timezone.build
    end
    
    def create
        @user = User.find(params[:user_id])
        @timezone = @user.timezone.create(timezone_params)
        #@timezone = Timezone.new(timezone_params)
        
        if @timezone.save
            flash[:success] = "You have successfully added #{@timezone.time_zone}!"
            redirect_to user_timezones_path(@user)
        else
            flash[:danger] = "Oh snap! Something wrong had happened!"
            render 'new'
        end
    end
    
    def new
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def timezone_params
        params.require(:timezone).permit(:time_zone, :id)
    end
end
