class ApplicationsController < ApplicationController
  
  def index
    @applications = Application.all
    render json: @applications
  end

  def create
    @application = Application.new(application_params)
    @application.chat_count = 0
    @application.save
    render json: @application
  end

  private

  def application_params
    params.permit(:name, :access_token)
  end
end
