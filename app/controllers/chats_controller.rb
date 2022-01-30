require 'redis'


class ChatsController < ApplicationController

  include Render 

  def index
   @application = Application.find_by_access_token(params[:application_access_token])
   @chats = @application.chats.all
   render json: @chats
  end


  def create
  	@application = Application.find_by_access_token(params[:application_access_token])
        
    redis = Redis.new( host: "redis")
    chat_id = redis.incr("chat_count_app_#{@application.id}")

    @chat =Chat.new(application_id: @application.id, chat_id: chat_id)

  	@chat.save!	
    render json: @chat
  end

end

