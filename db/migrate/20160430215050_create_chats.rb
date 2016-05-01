class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :message
      t.string :created_at
      t.string :timestamp

      t.timestamps null: false
    end
  end
end
