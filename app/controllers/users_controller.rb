class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  # possible add the login popup when a user gets to a page that needs login? Yes make a shared layout for it like the errors.
  # add to the user's show page all user info and add the delete functionality there but only availavble to that user or admins.
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

    def edit
      @user = User.find(params[:id])
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "The user has been deleted."
      redirect_to railsChat_path
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
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
  end
