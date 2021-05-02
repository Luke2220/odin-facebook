class UserMailer < ApplicationMailer

    def welcome_email 
        @user = params[:user]
        @url = 'localhost3000.com'
        mail(to: @user[:email], subject: "Welcome to mech picture site")
    end

end
