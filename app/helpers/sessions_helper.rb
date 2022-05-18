module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
        session[:user_max_role] = user.roles.select('value').order('value': 'ASC').first
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def user_max_role
        @user_max_role ||= session[:user_max_role]
    end

    def validate_login params
        mail_format = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
        if params[:session][:emailInput] === ""
            flash.now[:empty_email] = "<div class='error-text' id='error-empty-email'>Email is required!</div>".html_safe
            pass_validate = false
        else
            if params[:session][:mailInput].length > 256
                flash.now[:limit_email] = "<div class='error-text' id='error-limit'>Length Max is 256!</div>".html_safe
                pass_validate = false
            end
            if params[:session][:mailInput].match(mail_format).nil?
                flash.now[:format_email] = "<div class='error-text' id='error-format'>Email is format!</div>".html_safe
                pass_validate = false
            end
        end
        if params[:session][:passwordInput] === ""
            flash.now[:empty_password] = "<div class='error-text' id='error-empty-password'>Password is required!</div>".html_safe
            pass_validate = false
        else params[:session][:passwordInput].length > 256
            flash.now[:limit_password] = "<div class='error-text' id='error-limit-password'>Password max length is 256!</div>".html_safe
            pass_validate = false
        end
        pass_validate || true
    end

    def auth_admin_log_in
        unless logged_in? && user_max_role && user_max_role["value"] === Company::ROLES[:role_admin]
            redirect_to login_path
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def after_logged_in
        if logged_in?
            redirect_to "/"
        end
    end

end
