class AccountActivationsController < ApplicationController
  def edit
    user = User.where(email: params[:email]).first
    if user.present? && !user.activated && user.authenticated?("activation_digest", params[:id])
      user.update(activated: true, activated_at: Time.now)
      log_in user
      flash[:success] = "Account acctivated!"
      redirect_to user
      # not activated
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_path
      # activated or invalid acctivated link
    end
  end
end
