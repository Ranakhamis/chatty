require 'redis'


class ChatsController < ApplicationController

  def index
   @application = Application.find_by_access_token(params[:application_access_token])
   @chats = @application.chats.all
   render json: @chats
  end


  def create
  	@application = Application.find_by_access_token(params[:application_access_token])
    
    @chat =Chat.new(application_id: @application.id, chat_id: 1)
    byebug

    #@chat.message_count = 0
    #@chat.increment(:chat_count)
    #@chat = redis.incr(chat_count)
  	@chat.save!	
    render json: @chat
  end

  private
  def chat_params
    params.permit(:chat_id, :access_token)
  end

end
