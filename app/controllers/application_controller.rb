class ApplicationController < ActionController::API
  include Knock::Authenticable
  
  def authenticate_admin
    unless current_user && current_user.admin 
      render json: {errors: "Not authorized!"}, status: :unauthorized
    end
  end
  #above, to prohibit non-admin users from creating, updating, and deleting products. (You’ll need to create the authenticate_admin method in the application_controller).
end
