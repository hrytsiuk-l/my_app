# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[login register]

  def register
    @user = User.create(user_params)
    if @user.save
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: @user.errors
    end
  end

  def login
    authenticate params[:email], params[:password]
  end

  def test
    render json: { message: 'You have passed authentication and authorization test' }
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)

    if command.success?
      render json: { access_token: command.result, message: 'Login Successful' }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
