class ChatJob
  include Sidekiq::Job
  sidekiq_options queue: :chat


  def perform_async(access_token, chat_id)
    application = Application.find_by!(access_token: access_token)
    application.chats.create!(chat_id: chat_id, message_count: 0)
    @chat.save!

  end
end

