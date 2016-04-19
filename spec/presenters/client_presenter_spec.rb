require 'rails_helper'

RSpec.describe ClientPresenter, type: :presenter, client: true do
  let(:client) { build(:client) }
  subject(:client_presenter) { ClientPresenter.new(object: client, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
