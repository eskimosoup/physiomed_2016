# == Schema Information
#
# Table name: client_zone_additional_contents
#
#  id         :integer          not null, primary key
#  area       :string           not null
#  title      :string
#  content    :text
#  display    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ClientZone::AdditionalContent, type: :model, client_zone_additional_content: true do
  describe 'validations', :validation do
    subject(:client_zone_additional_content) { build(:client_zone_additional_content) }
    it { should validate_inclusion_of(:area).in_array(ClientZone::AdditionalContent::AREAS) }
    it { should validate_uniqueness_of(:area) }
  end

  describe 'scopes', :scope do
    let(:client_zone_additional_content) { create(:client_zone_additional_content) }
    let(:hidden_client_zone_additional_content) { create(:client_zone_additional_content, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(ClientZone::AdditionalContent.displayed).not_to include hidden_client_zone_additional_content
      end

      it 'returns displayed records' do
        expect(ClientZone::AdditionalContent.displayed).to include client_zone_additional_content
      end
    end
  end
end
