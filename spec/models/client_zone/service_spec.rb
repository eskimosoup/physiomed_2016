# == Schema Information
#
# Table name: client_zone_services
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  summary    :text             not null
#  file       :string           not null
#  image      :string
#  display    :boolean          default(TRUE)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

require 'rails_helper'
#  rspec --tag 'client_zone_service'
RSpec.describe ClientZone::Service, type: :model, client_zone_service: true do
  describe 'validations', :validation do
    let(:client_zone_service) { create(:client_zone_service) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:file) }
  end

  describe 'scopes', :scope do
    let(:client_zone_service) { create(:client_zone_service) }
    let(:hidden_client_zone_service) { create(:client_zone_service, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(ClientZone::Service.displayed).not_to include hidden_client_zone_service
      end

      it 'returns displayed records' do
        expect(ClientZone::Service.displayed).to include client_zone_service
      end
    end
  end
end
