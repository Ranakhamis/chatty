class Chat < ApplicationRecord
  belongs_to :application, counter_cache: :chat_count, touch: true

  has_many :messages, dependent: :destroy

  validates :chat_id,
            presence: true,
            uniqueness: { scope: :application_id }  
end
