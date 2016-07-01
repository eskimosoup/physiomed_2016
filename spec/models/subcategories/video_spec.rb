require 'rails_helper'

RSpec.describe Subcategories::Video, type: :model, subcategory: true do
  describe 'validations', :validation do
    subject(:subcategories_video) { build(:subcategories_video) }
    it { should validate_presence_of(:subcategory_id) }
    it { should validate_presence_of(:video_id) }
  end

  describe 'associations', :association do
    it { should belong_to(:video) }
    it { should belong_to(:subcategory) }
  end
end
