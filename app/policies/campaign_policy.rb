# frozen_string_literal: true

class CampaignPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? && user == campaign.user
  end
 
  def destroy?
    user.admin? && user == campaign.user
  end

  private

    def campaign
      record
    end
end
