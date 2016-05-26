class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :index]
  attr_accessor :name

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @sent_chat_pms = @user.chat_pms.all
    @receive_chat_pms = ChatPm.where(receiver: @user.name)
    @chat_pm = current_user.chat_pms.build if logged_in?

  end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in(@user)
        redirect_to railsChat_path
      else
        render 'rails_chat/home'
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "The user has been deleted."
      redirect_to(users_path)
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        @user.update(user_action_time_stamp: DateTime.now)
        redirect_to edit_user_path(@user)
        flash[:success] = "Your Profile has been updated."
      else
        render 'edit'
      end
    end

    private
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end

      def logged_in_user
        unless logged_in?
          store_location
          render 'edit'
        end
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(edit_user_path(current_user)) unless @user == current_user
      end

      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end

  end
