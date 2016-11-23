module ClientZone
  class ServicesController < BaseController
    def index
      @services = Service.displayed
      @additional_content = AdditionalContent.displayed.find_by(area: 'services')
    end
  end
end
