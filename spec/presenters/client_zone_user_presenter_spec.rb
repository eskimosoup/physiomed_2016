require 'rails_helper'

RSpec.describe ClientZone::UserPresenter, type: :presenter, client_zone_user: true do
  let(:client_zone_user) { build(:client_zone_user) }
  subject(:client_zone_user_presenter) { ClientZone::UserPresenter.new(object: client_zone_user, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
