class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # PERMISSIBLE_ATTRIBUTES = %i(name image image_cache)
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  # before_actionで下で定義したメソッドを実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  #変数PERMISSIBLE_ATTRIBUTESに配列[:name]を代入

  PERMISSIBLE_ATTRIBUTES = %i(name image image_cache)
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end
end
