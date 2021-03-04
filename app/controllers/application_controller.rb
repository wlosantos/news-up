class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permited_parameters, if: :devise_controller?

  layout :layout_by_resource

  def set_locale
    I18n.locale = params[:lang] || I18n.default_locale
  end

  private

  def layout_by_resource
    'authentication' if devise_controller?
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[ name username kind status ]
    devise_parameter_sanitizer.permit :account_update, keys: %i[ name avatar ]
  end

end
