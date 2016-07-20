require 'rails_helper'

RSpec.describe Subcategories::Guide, type: :model do
  describe 'associations', :association do
    it { should belong_to(:guide).class_name('::Guide') }
    it { should belong_to(:subcategory).class_name('::Subcategory') }
  end
end
