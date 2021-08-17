class CreateUserPolicy
  attr_reader :current_user, :resource

  def initialize(current_user:, resource:)
    @current_user = current_user
    @resource = resource
  end

  def if_admin?
    current_user.admin?(resource)
  end
end
