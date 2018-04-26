require "faker"

class UsersController < ApplicationController
    before_action :require_login
   
    def invite
        @user = User.new
    end 

    def invite_create
        user = User.new(user_params)
        user.name = "new user"
        user.password = Faker::Internet.password
        user.invited = true
        user.save

        UserMailer.with(user: user).welcome_email.deliver_now
    end 

    private

    def user_params
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :invited
        )
    end 
end
