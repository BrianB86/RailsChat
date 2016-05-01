class ChatsController < ApplicationController

  def railsChat #This is our area for the chat client. initialize subscriber here.
    redirect_to root_url unless logged_in?
    @chatUsers = User.select(:name).where("user_action_time_stamp > ? AND login_notice = ?", DateTime.now - 15.minutes, true ) #maybe add find_each
    @messages = Chat.all
  end

  def create #create a message and #notify publish users that a new message was posted.
    @message = Chat.new(message_params)
    @submit_user = User.find_by(id: session[:user_id])
    @submit_user.update(user_action_time_stamp: DateTime.now)
  end

private
  def message_params
    params.require(:chat).permit(:message)
  end
end
