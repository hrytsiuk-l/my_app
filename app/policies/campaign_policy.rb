# frozen_string_literal: true

class CampaignPolicy < ApplicationPolicy
  def index?
    read_permission?
  end

  def create?
   manage_permission? 
    # rails// error
  end

  def update?
    manage_permission?
  end

  def destroy?
    manage_permission?
  end

  private

  def manage_permission?
    user.roles.any? { |role| role.permission == 'manage' && role.resource_name == 'Campaign' }
  end

  def read_permission?
    user.roles.any? { |role| role.permission == 'read' }
  end
end
