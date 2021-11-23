class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    
    sign_up(resource_name, resource) if resource.save

    render_jsonapi_response(resource)
  end
end 