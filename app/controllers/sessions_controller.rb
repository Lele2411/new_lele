class SessionsController < ApplicationController
    before_action :after_logged_in, only: :new

  def new
  end

  def create
    result_validate = validate_login params
    if result_validate
        user = User.find_by(email: params[:session][:mailInput])
        if user && user.authenticate(params[:session][:passwordInput])
            log_in user
            max_role = user_max_role
            if max_role && max_role[:value] === Company::ROLES[:role_admin]
                #case admin
                redirect_to companies_path
            end
            if max_role && max_role[:value] === Company::ROLES[:role_company_admin]
                #case company_admin
                render html: 'case company_admin'
            end
            if max_role && max_role[:value] === Company::ROLES[:role_user]
                #case user
                render html: 'case user'
            end
        else
            flash.now[:login_failed] = "Account Invalid!<br>Please check your email and password!".html_safe
            render 'new'
        end
    else
        render 'new'
    end
  end

  def index
  end

  def destroy
    if current_user
        session.delete(:user_id)
    end
        redirect_to login_path
  end

  private

end
