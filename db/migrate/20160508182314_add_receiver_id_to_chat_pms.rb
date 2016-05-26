class AddReceiverIdToChatPms < ActiveRecord::Migration
  def change
    add_column :chat_pms, :receiver, :string
  end
end
