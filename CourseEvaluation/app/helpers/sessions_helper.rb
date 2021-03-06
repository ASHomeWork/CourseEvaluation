module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end


    def logged_in?
        !current_user.nil?
    end

    def log_out
        forget(current_user)
        session.delete(:user_id)
        #reset_session
        @current_user = nil
    end

    def remember(user)
        user.remember
        cookies.permanent[:remember_token] = user.remember_token
        cookies.permanent.signed[:user_id] = user.id
    end

    def current_user
        if session[:user_id] != nil
            user = User.find_by(id: session[:user_id])
            @current_user ||= user
        elsif cookies.signed[:user_id] != nil
            user = User.find_by(id: cookies.signed[:user_id])
            if user && user.authenticated?(cookies[:remember_token])
                log_in(user)
                @current_user = user
            else
                return nil
            end
        else
            if @current_user.nil?
                return nil
            else
                return @current_user
            end
        end
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
end
