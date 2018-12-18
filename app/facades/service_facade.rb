class ServiceFacade < Services::CategoryFacade
  attr_reader :service

  delegate :style, :layout, to: :service, prefix: true

  def initialize(service, category)
    @service = service
    @category = category
  end

  def services
    @services ||= Service.displayed
  end

  def sections
    @sections ||= service.sections.displayed
  end
end
