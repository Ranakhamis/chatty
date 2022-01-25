class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :access_token
      t.integer :chat_count

      t.timestamps
    end
  end
end
