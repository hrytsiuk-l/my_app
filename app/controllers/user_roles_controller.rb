class UserRolesController < ApplicationController
  def create
    if policy.if_admin?
  end

  private

  def policy
    CreateUserPolicy.new(current_user: current_user, resource: @campaign)
  end

end