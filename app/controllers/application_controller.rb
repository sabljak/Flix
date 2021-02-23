class ApplicationController < ActionController::Base
  include Authentication

  private

  def current_user_admin?
    Current.user && Current.user.admin?
  end

  helper_method :current_user_admin?

  def require_signin
    unless Current.user
      session[:intended_url] = request.url
      redirect_to login_path, alert: "You must be signed in!"
    end
  end

  def require_admin
    unless current_user_admin?
      redirect_to movies_url, alert: "Unauthorized access!"
    end
  end

end
