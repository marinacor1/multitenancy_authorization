class PermissionsService
  def initialize(user, controller, action)
    @_user = user
    @_controler = controller
    @_action = action #underscores says that variable will be accessed through a method
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
