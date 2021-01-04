class ApplicationController < ActionController::Base
    before_action :set_global_search_variable
    def set_global_search_variable
        @q = Course.ransack(params[:q])
    end
end
