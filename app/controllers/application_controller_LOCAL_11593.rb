class ApplicationController < ActionController::API

  def pong_return
    render json: {“pong”: 200 } if params[:ping]
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
