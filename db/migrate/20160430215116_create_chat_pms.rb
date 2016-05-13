class CreateChatPms < ActiveRecord::Migration
  def change
    create_table :chat_pms do |t|
      t.text :message
      t.string :created_at
      t.string :timestamp
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :chat_pms, [:user_id, :created_at]
  end
end
