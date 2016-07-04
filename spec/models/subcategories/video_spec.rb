require 'rails_helper'

RSpec.describe Subcategories::Video, type: :model, subcategory: true do
  describe 'associations', :association do
    it { should belong_to(:video).class_name('::Video') }
    it { should belong_to(:subcategory).class_name('::Subcategory') }
  end
end
