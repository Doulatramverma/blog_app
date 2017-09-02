class ApplicationController < ActionController::Base
  
 before_action :authenticate_user!
 
  before_filter :ensure_signup_complete, only: [:new, :create, :update, :destroy]
 # protect_from_forgery with: :exception
 protect_from_forgery with: :exception, prepend: true
 before_action :configure_permitted_parameters, if: :devise_controller?

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end
 
 protected

  
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email,:name, :about,  :password, :current_password,:password_confirmation, :avatar) }
  end
  
end

 

  