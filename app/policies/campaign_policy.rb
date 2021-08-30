# frozen_string_literal: true

class CampaignPolicy < ApplicationPolicy
  def index?
    read_permission?
  end

  def create?
    manage_permission? && check_user
  end

  def update?
    manage_permission? && check_user
  end

  def destroy?
    manage_permission? && check_user
  end

  private

  def check_user
    user == campaign.user
  end

  def manage_permission?
    user.roles.any? { |role| role.permission == 'manage' && role.resource_name == 'Campaign' }
  end

  def read_permission?
    user.roles.any? { |role| role.permission == 'read' }
  end
end
