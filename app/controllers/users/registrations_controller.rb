# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected
  def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :position_id, :name])
  end

  def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :name])
  end
end
