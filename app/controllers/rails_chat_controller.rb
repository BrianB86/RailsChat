class RailsChatController < ApplicationController

  def home
    @user = User.new
  end
end
