class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        products_path
    end
    def after_sign_out_path_for(resources)
        new_user_session_path
    end
end
