module SessionsHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    current_user.present?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user && user.forget
    session.delete(:user_id)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    forget @current_user
  end
end
