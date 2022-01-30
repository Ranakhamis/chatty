require 'redis'


class ChatsController < ApplicationController

  def index
   @application = Application.find_by_access_token(params[:application_access_token])
   @chats = @application.chats.all
   render json: @chats
  end


  def create
  	@application = Application.find_by_access_token(params[:application_access_token])
        
    #redis = Redis.new('localhost')
    #chat_count = redis.incr("chat_count")
    @chat =Chat.new(application_id: @application.id, chat_id: 1)

  	@chat.save!	
    render json: @chat.to_json(:except => [:chat_id, :application_id])
  end

end

