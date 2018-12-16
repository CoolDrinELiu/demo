class SessionsController < ApplicationController
  include SessionsHelper

  def create
    a = User.find_by(email: session_params["email"])
    if a && a.authenticate(session_params["password"])
      sign_in a
      remember a
      redirect_to user_path a
    else
      flash.now[:error] = 'Invalid email/password combination'
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def new
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
