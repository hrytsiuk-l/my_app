# frozen_string_literal: true

class CampaignPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? && user == record.user
  end
 
  def destroy?
    user.admin? && user == record.user
  end
end
