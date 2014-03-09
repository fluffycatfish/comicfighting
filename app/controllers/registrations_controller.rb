class RegistrationsController < Devise::RegistrationsController
	def new
		@profile = Profile.new
		super
	end

	def create
		build_resource(sign_up_params)
      
      if(User.count == 0)
         resource.admin = true
      end

   		if resource.save
   			@profile = Profile.new(profile_params)
            

   			@profile.user_id = resource.id
   			if @profile.save
               redirect_to :controller => 'static_pages', :action => 'home'
   			else

   			end
         else
            # render invalid credential
   		end
	end

 def profile_params
 	params.require(:profile).permit(:username, :about, :user_id)
 end
end
