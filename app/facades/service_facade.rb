class ServiceFacade
  delegate :style, :layout, to: :service, prefix: true

  def initialize(service)
    @service = service
  end

  def services
    @services ||= Service.displayed
  end

  private

  attr_reader :service
end
