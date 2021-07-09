class Users::RegistrationsController < Devise::RegistrationsController
   after_action :assign_role, only:[:create]
	#ruolo default 
	
	def assign_role
		if not current_user.nil?
  			current_user.set_iscritto
  		end
	end

end
