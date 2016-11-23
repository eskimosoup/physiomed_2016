module ClientZone
  class ServicesController < BaseController
    def index
      @services = Service.displayed
    end
  end
end
