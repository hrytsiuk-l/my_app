class UserRolesController < ApplicationController
  def create
    if policy.admin?
  end
  
  private

  def policy
    CreateUserPolicy.new(current_user: current_user, resource: @campaign)
  end

end