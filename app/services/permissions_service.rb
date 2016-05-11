class PermissionsService
  def initialize(user, controller, action) #pass user object or id? debatable
    @_user = user || User.new
    @_controller = controller
    @_action = action
  end

  def allow?
    if user.platform_admin?
      return true if controller = "sessions"
      return true if controller == "items" && action.in?(%w( index show))
      return true if controller == "orders" && action.in?(%w( index show))
      return true if controller == "users" && action.in?(%w( index show))
      return true if controller == "stores" && action.in?(%w( index show))
    elsif user.store_admin?
      return true if controller == "items" && action.in?(%w( index show))
      return true if controller == "orders" && action.in?(%w( index show))
      return true if controller == "stores" && action.in?(%w( index show))
    elsif user.registered_user?
      return true if controller == "items" && action.in?(%w( index show))
      return true if controller == "stores" && action.in?(%w( index show))
      return true if controller == "orders" && action.in?(%w( show))
    else
      return true if controller == "stores" && action == "index"
      return true if controller == "sessions" && action == "new"
      return true if controller == "sessions" && action == "create"
      return true if controller == "sessions" && action == "destroy"
    end
  end

  private

  def controller
    @_controller
  end

  def action
    @_action
  end

  def user
    @_user
  end
end
