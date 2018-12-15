class SessionsController < ApplicationController
  def create
    a = User.find_by(email: session_params["email"])
    if a.authenticate(session_params["password"])
      sign_in a
      remmber a
      redirect_to root_path
    end
  end

  def destroy
  end

  def new
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
