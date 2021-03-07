class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :authenticate_user!, except: [ :index, :list_posts, :list_videos, :show, :search ]
  before_action :configure_permited_parameters, if: :devise_controller?

  layout :layout_by_resource

  def set_locale
    unless params[:lang]
      if user_signed_in?
        I18n.locale = current_user.language || I18n.default_locale
      else
        I18n.locale = I18n.default_locale
      end
    else
      I18n.locale = params[:lang] || I18n.default_locale
    end
  end

  private

  def layout_by_resource
    'authentication' if devise_controller?
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[ name username kind status language]
    devise_parameter_sanitizer.permit :account_update, keys: %i[ name avatar language]
  end

end
