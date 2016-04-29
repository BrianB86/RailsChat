class AddUserActionTimeStamp < ActiveRecord::Migration
  def change
    add_column :users, :user_action_time_stamp, :datetime 
  end
end
