require 'rails_helper'

RSpec.describe CategoryPresenter, type: :presenter, category: true do
  let(:category) { build(:category) }
  subject(:category_presenter) { CategoryPresenter.new(object: category, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
