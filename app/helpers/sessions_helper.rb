module SessionsHelper
  def current_user
    if session["user_id"].present?
      @current_user ||= User.find session["user_id"]
    end
  end

  def logged_in?
    current_user.present?
  end

end
