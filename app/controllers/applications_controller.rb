class ApplicationsController < ApplicationController
  
  include Render 
  
  def index
    @applications = Application.all
    render_json @applications
  end

  def create
    @application = Application.new(application_params)
    @application.save!
    render_json @application
  end

  private

  def application_params
    params.permit(:name, :access_token)
  end
end
