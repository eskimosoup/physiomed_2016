require 'rails_helper'

RSpec.describe ClientZone::ServicePresenter, type: :presenter, client_zone_service: true do
  let(:client_zone_service) { build(:client_zone_service) }
  subject(:client_zone_service_presenter) { ClientZone::ServicePresenter.new(object: client_zone_service, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
