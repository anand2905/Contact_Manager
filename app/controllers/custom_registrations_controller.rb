class CustomRegistrationsController < Devise::RegistrationsController

  #Protected

    def after_update_path_for(resource)
      dashboard_path
    end
end
