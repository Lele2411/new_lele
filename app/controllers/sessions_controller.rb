class SessionsController < ApplicationController

  def new
  end

  def create
    result_validate = validate_login params
    if result_validate
        user = User.find_by(email: params[:session][:mailInput])
        if user && user.authenticate(params[:session][:passwordInput])
            log_in user
            max_role = user_max_role(user)
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
            flash.now[:login_failed] = "Account Invalid!<br>Please check your email and password!".html_safe
            render 'new'
        end
    else
        render 'new'
    end
  end

  private

end
