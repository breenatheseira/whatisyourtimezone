class ProfilesController < ApplicationController
    
    private
    def profile_params
        params.require(:profile).permit(:id, :birthdate, :location)
    end
end

