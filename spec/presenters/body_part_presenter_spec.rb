require 'rails_helper'

RSpec.describe BodyPartPresenter, type: :presenter, body_part: true do
  let(:body_part) { build(:body_part) }
  subject(:body_part_presenter) { BodyPartPresenter.new(object: body_part, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
