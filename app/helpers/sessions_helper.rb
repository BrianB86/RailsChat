module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    @enter_user = User.find_by(id: session[:user_id])
    @enter_user.update(login_notice: true)
    @enter_user.update(user_action_time_stamp: DateTime.now)
  end

  def log_out
    @exit_user = User.find_by(id: session[:user_id])
    @exit_user.update(login_notice: false)
    session.delete(:user_id)
    @current_user = nil
    @user = User.new # find out the implications of this
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) //test users on heroku.
  end

  def logged_in?
    !current_user.nil?
  end
end
