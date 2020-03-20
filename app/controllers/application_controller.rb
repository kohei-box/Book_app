class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def configure_permitted_parameters
      added_attrs = [:name]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      #独自パラメータを追加し、ストロングパラメータ設定するには
      #配列にまとめ、devise_parameter_sanitizer.permitに渡す。
      #そしてcondigure_permitted_parametersというメソッドとし、before＿action
  end
  
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
  
end
