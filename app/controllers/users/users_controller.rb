module Users
  class UsersController < ApplicationController
    before_action :authenticate_user!, only: :show
    before_action :user, only: :show

    def index
    end

    def show   
    end

    def user
      @user = current_user
    end
  end
end