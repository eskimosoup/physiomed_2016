# == Schema Information
#
# Table name: client_zone_users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  auth_token      :string           not null
#  active          :boolean          default(TRUE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe ClientZone::User, type: :model, client_zone_user: true do
  describe 'validations', :validation do
    subject(:client_zone_user) { build(:client_zone_user) }
    it { should validate_presence_of(:username) }
    it { should have_secure_password }
    it { should validate_uniqueness_of(:username).case_insensitive.with_message('is already taken') }
  end

  describe 'scopes', :scope do
    let(:client_zone_user) { create(:client_zone_user) }
    let(:inactive_client_zone_user) { create(:client_zone_user, active: false) }

    describe 'active' do
      it 'excludes inactive records' do
        expect(ClientZone::User.active).not_to include inactive_client_zone_user
      end

      it 'returns active records' do
        expect(ClientZone::User.active).to include client_zone_user
      end
    end
  end

  context 'callbacks' do
    let(:client_zone_user) { create(:client_zone_user) }
    it { expect(client_zone_user).to callback(:generate_auth_token).before(:create) }
  end
end
