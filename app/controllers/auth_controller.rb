class AuthController < ActionController::Base
  layout "application"

  def not_logged
  end

  def login
    @user = User.find_or_initialize_by(email: params[:email])
    if @user.save
      cookies.signed.permanent[:user_email] = params[:email]
      redirect_to root_path
    else
      render :not_logged
    end
  end

  def logout
    cookies.delete :user_email
    redirect_to not_logged_path
  end
end
