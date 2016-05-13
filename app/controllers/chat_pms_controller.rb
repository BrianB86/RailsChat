class ChatPmsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @chat_pm = current_user.chat_pms.build(chat_pm_params)
    if @chat_pm.save
      flash.now[:success] = "Message Sent!"
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @chat_pm.destroy
    flash[:success] = "Private Message Deleted."
    redirect_to user_path(current_user)
  end

  private
    def chat_pm_params
      params.require(:chat_pm).permit(:message, :receiver)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
      end
    end

    def correct_user
      @chat_pm = current_user.chat_pms.find_by(id: params[:id])
    end

end
