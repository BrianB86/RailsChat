class UsersController < ApplicationController
  attr_accessor :name

  def show
    @user = User.find(params[:id])
  end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to railsChat_path
      else
        render 'rails_chat/home'
      end
    end
    private
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
  end
