require 'rails_helper'

RSpec.describe GuidePresenter, type: :presenter, guide: true do
  let(:guide) { build(:guide) }
  subject(:guide_presenter) { GuidePresenter.new(object: guide, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
