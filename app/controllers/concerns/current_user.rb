module CurrentUser
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  private

  def set_current_user
    @current_user ||= User.find_by_email(cookies.signed.permanent[:user_email])
  end
end