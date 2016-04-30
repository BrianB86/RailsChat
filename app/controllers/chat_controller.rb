class ChatController < ApplicationController

  def railsChat #This is our area for the chat client. initialize subscriber here.
    redirect_to root_url unless logged_in?
    @chatUsers = User.select(:name).where("user_action_time_stamp > ? AND login_notice = ?", DateTime.now - 15.minutes, true ) #maybe add find_each
  end

  def show #show all messages

  end

  def create #create a message and #notify publish users that a new message was posted.

  end
end
