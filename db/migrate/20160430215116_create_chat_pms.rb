class CreateChatPms < ActiveRecord::Migration
  def change
    create_table :chat_pms do |t|
      t.text :message
      t.string :created_at
      t.string :timestamp
      t.references :user

      t.timestamps null: false
    end
  end
end
