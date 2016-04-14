require 'rails_helper'

RSpec.describe AdditionalHomeContentPresenter, type: :presenter, additional_home_content: true do
  let(:additional_home_content) { build(:additional_home_content) }
  subject(:additional_home_content_presenter) { AdditionalHomeContentPresenter.new(object: additional_home_content, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
