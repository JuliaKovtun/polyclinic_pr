module Users
    class UsersController < ApplicationController
        before_action :authenticate_user!
        before_action :user

        def index
        end

        def show   
        end

        def user
            @user = current_user
        end
    end
end