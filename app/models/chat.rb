class Chat < ApplicationRecord
  belongs_to :application, counter_cache: :chat_count, touch: true

  has_many :messages, dependent: :destroy
end
