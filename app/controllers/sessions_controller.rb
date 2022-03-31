class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    resource.generate_jwt
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
end