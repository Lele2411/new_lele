class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:mailInput])
    if user && user.authenticate(params[:passwordInput])
      #login
    else
      flash.now[:danger] = "Account Invalid! Please check your email and password"
      render html: 'hehe'
    end

  end
end
