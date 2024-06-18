module ApplicationHelper
    def current_user
        session[:user_id]
    end

    def logged_in?
        current_user.present?
    end
end
