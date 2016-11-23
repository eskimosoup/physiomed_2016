class ClientZone::ServicePresenter < BasePresenter
  presents :client_zone_service
  delegate :id, to: :client_zone_service
end
