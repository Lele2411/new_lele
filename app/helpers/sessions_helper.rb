module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def user_max_role(user)
        UserRole.select('role').where('user_id', user.id).order('role': 'DESC').first
    end
end
