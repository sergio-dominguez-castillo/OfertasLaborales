class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, 
    :position, :note, :photo])
    end

    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
        redirect_to root_path, notice: "You are not authorized to perform this action"
        end
    end


end
