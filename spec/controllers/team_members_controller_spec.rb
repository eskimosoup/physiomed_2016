require 'rails_helper'

RSpec.describe TeamMembersController do
  context 'team member is displayed' do
    it 'gets a 200 OK' do
      team_member = create(:team_member, display: true)

      get :show, id: team_member.slug

      expect(response.status).to eq(200)
    end
  end

  context 'team_member is not displayed' do
    it 'returns a 404' do
      team_member = create(:team_member, display: false)

      expect do
        get :show, id: team_member.slug
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
