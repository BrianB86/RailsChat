class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to(railsChat_path)
    else
      flash.now[:danger] = "Invalid Username and Password combination."
      @user = User.new
      render 'rails_chat/home'
    end
  end

  def destroy
    log_out
    render 'rails_chat/home'
  end

  private
    def update_time(user)
      user.update(user_action_time_stamp: Time.now)
    end
end
