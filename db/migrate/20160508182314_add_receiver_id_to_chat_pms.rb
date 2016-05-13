class AddReceiverIdToChatPms < ActiveRecord::Migration
  def change
    add_column :chat_pms, :receiver, :integer
  end
end
