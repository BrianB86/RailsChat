class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to railsChat_path
    else
      flash.now[:danger] = "Invalid Username and Password combination."
      @user = User.new #find out implications of keeping this.
      render 'rails_chat/home'
    end
  end

  def destroy
    log_out
    render 'rails_chat/home'
  end
end
