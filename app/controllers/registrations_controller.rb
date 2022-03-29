class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    routines_path(resource) || welcome_path
  end
end
