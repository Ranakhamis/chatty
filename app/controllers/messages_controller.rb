require 'redis'

class MessagesController < ApplicationController

include Render 

 def index
   @application = Application.find_by_access_token(params[:application_access_token])
   @chat = Chat.find_by_chat_id(params[:chat_access_token])
   @messages = @chat.messages.all
   render json: @messages
  end


  def create
  	@application = Application.find_by_access_token(params[:application_access_token])

  	@chat = Chat.find_by_chat_id(params[:chat_access_token])

    redis = Redis.new( host: "redis")
    message_id = redis.incr("message_count_chat_#{@chat.id}")
    
    @message =Message.new(chat_id: @chat.id, message_id: message_id , content: 'ducks kteeer')
    
  	@message.save!	
    render json: @message
  end

  def search
    @application = Application.find_by_access_token(params[:application_access_token])
    @chat = Chat.find_by_chat_id(params[:chat_access_token])
    render json: Message.search(params[:keyword], @chat.id)

  end
  
end
