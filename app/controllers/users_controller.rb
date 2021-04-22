class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :password, :password_confirmation))
        if @user.save && params[:password] == params[:password_confirmation]
            session[:user_id] = @user.id
        else
            redirect_to "/signup"
        end
    end
end
