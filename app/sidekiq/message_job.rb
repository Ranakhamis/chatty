class MessageJob
  include Sidekiq::Job
  sidekiq_options queue: :message

  def perform(access_token, chat_id, message_id, content)
    application = Application.find_by!(access_token: access_token)
    chat = application.chats.find_by!(chat_id: chat_id)
    chat.messages.create!(message_id: message_id, content: content)
  end
end
