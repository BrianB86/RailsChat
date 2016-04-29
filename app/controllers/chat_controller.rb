class ChatController < ApplicationController

  def railsChat #This is our area for the chat client.
    redirect_to root_url unless logged_in?
    @chatUsers = User.select(:name).where("user_action_time_stamp > ? AND login_notice = ?", DateTime.now - 15.minutes, true ) #maybe add find_each
  end
end
