class ApplicationController < ActionController::API
  # protect_from_forgery with: :exception
  before_action :authenticate_request
    attr_reader :current_user

    # include ExceptionHandler
  
    def pong_return
      render json: {“pong”: 200 } if params[:ping]
    end

    private
    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end