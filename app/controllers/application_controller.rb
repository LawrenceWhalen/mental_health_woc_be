class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::ParameterMissing, with: :blank_params

  protected

  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def not_found
    render json: {
      'errors': [
        {
          'status': '404',
          'message': 'Not Found'
        }
      ]
    }, status: 404
  end

  def blank_params
    render json: {
      'errors': [
        {
          'status': '403',
          'message': 'Missing required fields'
        }
      ]
    }, status: 403
  end

end
