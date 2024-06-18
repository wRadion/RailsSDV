class ApplicationController < ActionController::Base
    before_action :set_current_user

    def authenticate!
        redirect_to login_path unless @current_user
    end

    private

        def set_current_user
            if session[:user_id]
                @current_user = User.find(session[:user_id])
            end
        end
end
