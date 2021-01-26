class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		case resource
		when Manager
				root_path
		when Player
				root_path
		end
	end
	def after_sign_out_path_for(resource_or_scope)
		if resource_or_scope == :manager
				root_path
		elsif resource_or_scope == :player
				root_path
		end
	end	
end
