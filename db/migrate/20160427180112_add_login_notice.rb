class AddLoginNotice < ActiveRecord::Migration
  def change
    add_column :users, :login_notice, :boolean, default: false
  end
end
