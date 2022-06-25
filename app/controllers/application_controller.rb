class ApplicationController < ActionController::Base
  before_action :validate_username

  private

  def validate_username
    return if current_user.nil?

    return if request.path.include?('/users')

    if current_user.username.blank?
      redirect_to edit_user_registration_path,
                  alert: 'Please update your username before continuing.'
    end
  end
end
