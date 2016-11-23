require 'rails_helper'

RSpec.describe ClientZone::AdditionalContentPresenter, type: :presenter, client_zone_additional_content: true do
  let(:client_zone_additional_content) { build(:client_zone_additional_content) }
  subject(:client_zone_additional_content_presenter) { ClientZone::AdditionalContentPresenter.new(object: client_zone_additional_content, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
