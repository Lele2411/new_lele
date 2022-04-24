class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:mailInput])
    if user && user.authenticate(params[:passwordInput])
      log_in user
      max_role = user_max_role(user)
      byebug
      if max_role && max_role[:role] === 3
        #case admin
      end
      if max_role && max_role[:role] === 2
        #case company_admin
      end
      if max_role && max_role[:role] == 1
        #case user
      end
    else
      flash.now[:danger] = "Account Invalid!<br>Please check your email and password!".html_safe
      render 'new'
    end
  end
end
