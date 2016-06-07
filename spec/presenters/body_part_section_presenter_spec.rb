require 'rails_helper'

RSpec.describe BodyPartSectionPresenter, type: :presenter, body_part_section: true do
  let(:body_part_section) { build(:body_part_section) }
  subject(:body_part_section_presenter) { BodyPartSectionPresenter.new(object: body_part_section, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
