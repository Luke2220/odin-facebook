class RegistrationsController < Devise::RegistrationsController
    def new
      super
    end
  
    def create
      super
      #UserMailer.with(user: params[:user]).welcome_email.deliver_now
    end
  
    def update
      super
    end
  end 
  