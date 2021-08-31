# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :get_user
  before_action :set_role, only: %i[show update destroy]

  def new
    @role = @user.roles.new
  end

  def index
    @roles = @user.roles
  end

  def create
    @role = @user.roles.build(role_params)

    if @role.save
      render json: { status: :created, role: @role }
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def update
    if @role.update(role_params)
      render json: { status: :ok, role: @role }
    else
      render json: @role.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy
    head :no_content
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end

  def set_role
    @role = @user.roles.find_by(uid: params[:uid])
  end

  def role_params
    params.require(:role).permit(:name, :uid, :permission, :user_id)
  end
end
