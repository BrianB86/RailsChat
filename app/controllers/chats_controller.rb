class ChatsController < ApplicationController
  respond_to :html, :js

  def railsChat
    redirect_to root_url unless logged_in?
    @chatUsers = User.select(:name).where("user_action_time_stamp > ? AND login_notice = ?", DateTime.now - 15.minutes, true )
    @messages = Chat.all
    @chat_pm = current_user.chat_pms.build if logged_in?

  end

  def create
    @message = Chat.new(message_params)
    @chatUsers = User.select(:name).where("user_action_time_stamp > ? AND login_notice = ?", DateTime.now - 15.minutes, true )
    @submit_user = User.find_by(id: session[:user_id])
    @submit_user.update(user_action_time_stamp: DateTime.now)
  end

  def destroy
  end

private
  def message_params
    params.require(:chat).permit(:message)
  end

end
