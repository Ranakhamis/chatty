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

  def update
    @application = Application.find_by!(access_token: params[:access_token])
    @application.update(application_params)
    render json: @application
  end
  def show
    @application = Application.find_by!(access_token: params[:access_token])
    render json: @application
  end

  private

  def application_params
    params.permit(:name)
  end
end
