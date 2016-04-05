class RailsChatController < ApplicationController

  def home
    @user = User.new #find out implications of keeping this.
  end
end
