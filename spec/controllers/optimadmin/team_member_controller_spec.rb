require 'rails_helper'

describe Optimadmin::TeamMembersController, type: :controller, team_member: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Team member is valid' do
      it 'redirects to index on normal save' do
        team_member = stub_valid_team_member

        post :create, {
          team_member: team_member.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(team_members_path)
        expect(flash[:notice]).to eq('Team member was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        team_member = stub_valid_team_member

        post :create, {
          team_member: team_member.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_team_member_path(team_member))
        expect(flash[:notice]).to eq('Team member was successfully created.')
      end
    end

    context 'when Team member is invalid' do
      it 'does not redirect' do
        team_member = stub_invalid_team_member

        post :create, {
          team_member: team_member.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Team member is valid' do
      it 'redirects to index on normal save' do
        team_member = stub_valid_team_member

        patch :update, {
          id: team_member.id,
          team_member: team_member.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(team_members_path)
        expect(flash[:notice]).to eq('Team member was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        team_member = stub_valid_team_member

        patch :update, {
          id: team_member.id,
          team_member: team_member.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_team_member_path(team_member))
        expect(flash[:notice]).to eq('Team member was successfully updated.')
      end
    end

    context 'when Team member is invalid' do
      it 'does not redirect' do
        team_member = stub_invalid_team_member

        patch :update, {
          id: team_member.id,
          team_member: team_member.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_team_member
    team_member = build_stubbed(:team_member)
    allow(TeamMember).to receive(:new).and_return(team_member)
    allow(team_member).to receive(:save).and_return(true)
    allow(TeamMember).to receive(:find).and_return(team_member)
    allow(team_member).to receive(:update).and_return(true)
    team_member
  end

  def stub_invalid_team_member
    team_member = build_stubbed(:team_member)
    allow(TeamMember).to receive(:new).and_return(team_member)
    allow(team_member).to receive(:save).and_return(false)
    allow(TeamMember).to receive(:find).and_return(team_member)
    allow(team_member).to receive(:update).and_return(false)
    team_member
  end
end
