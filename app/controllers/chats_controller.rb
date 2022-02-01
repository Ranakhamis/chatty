require 'redis'


class ChatsController < ApplicationController

  before_action :set_application
  include Render 

  def index
   @chats = @application.chats.all
   render_json @chats
  end


  def create
        
    redis = Redis.new( host: "redis")
    chat_id = redis.incr("chat_count_app_#{@application.id}")
    ChatJob.perform_async(params[:application_access_token], chat_id)
    render json: {chat_id: chat_id}
  end

  private
  def chat_params
    params.permit(:chat_id)
  end

  def set_application
      @application = Application.find_by_access_token(params[:application_access_token])
  end 
end

