class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.bigint :app_id
      t.integer :chat_id
      t.integer :message_count
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
