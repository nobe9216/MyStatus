class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :nickname,
        :start_weight,
        :goal_weight,
        :start_fat,
        :age,
        :height,
        :sex,
      ]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: [
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :nickname,
        :profile_image,
        :start_weight,
        :goal_weight,
        :start_fat,
        :age,
        :height,
        :sex,
        :self_introduction,
      ]
    )
  end
end
