class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
    def invite_email
        @user = params[:user]
        mail(to: @user.email, subject: 'You have been invited to BGLPool!')
    end
end
