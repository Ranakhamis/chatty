require 'elasticsearch/model'

class Message < ApplicationRecord

  belongs_to :chat, counter_cache: :message_count, touch: true

  validates :message_id,
          presence: true,
          uniqueness: { scope: :chat_id }

  include Searchable

end