class ServiceStandardPresenter < BasePresenter
  presents :service_standard
  delegate :id, to: :service_standard
end
