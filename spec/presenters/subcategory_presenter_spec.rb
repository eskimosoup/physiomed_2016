require 'rails_helper'

RSpec.describe SubcategoryPresenter, type: :presenter, subcategory: true do
  let(:subcategory) { build(:subcategory) }
  subject(:subcategory_presenter) { SubcategoryPresenter.new(object: subcategory, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
