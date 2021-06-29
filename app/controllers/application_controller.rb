class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  
  def pong_return
    puts pong if params[:ping]
    render json: {“pong”: 200 }
  end
end