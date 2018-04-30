require "faker"
require "securerandom"

class UsersController < ApplicationController
    before_action :require_login, except: :manage_invited
   
    def invite
        @title = "Invite someone ..."
        @user = User.new
    end 

    def invite_pre_create
        user = User.new(user_params)
        user.name = "new user"
        user.password = Faker::Internet.password
        user.invited = true
        user.invite_token = SecureRandom.urlsafe_base64
        user.save

        UserMailer.with(user: user).invite_email.deliver_now
    end 

    def manage_invited
        user = User.find_by(invite_token: params[:invite_token])
        if user.blank? then 
            redirect_to root_url
        else
            @user = user
        end 
    end 

    def invite_create
        pp "-----------------"
        pp params
        pp "-----------------"

        if params[:new_password] === params[:new_password_again] then
            user = User.find(email: params[:email])

            user.name = params[:name]
            user.email = params[:email]
            user.password = params[:password]
            flash.now[:notice] = 'your awesome'
            redirect_to root_url
        else
            flash.now[:notice] = 'your fucked'
            redirect_to root_url
        end 
    end 

    private

    def user_params 
        params.require(:user).permit(
            :name,
            :email,
            :password,
            :new_password,
            :new_password_again,
            :invited,
            :invite_token
        )
    end 
end
