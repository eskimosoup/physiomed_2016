require 'rails_helper'

describe Optimadmin::ClientZone::UsersController, type: :controller, client_zone_user: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when User is valid' do
      it 'redirects to index on normal save' do
        client_zone_user = stub_valid_client_zone_user

        process :create, method: :post, params: {
          client_zone_user: client_zone_user.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(client_zone_users_path)
        expect(flash[:notice]).to eq('User was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        client_zone_user = stub_valid_client_zone_user

        process :create, method: :post, params: {
          client_zone_user: client_zone_user.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_client_zone_user_path(client_zone_user))
        expect(flash[:notice]).to eq('User was successfully created.')
      end
    end

    context 'when User is invalid' do
      it 'does not redirect' do
        client_zone_user = stub_invalid_client_zone_user

        process :create, method: :post, params: {
          client_zone_user: client_zone_user.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when User is valid' do
      it 'redirects to index on normal save' do
        client_zone_user = stub_valid_client_zone_user

        process :update, method: :patch, params: {
          id: client_zone_user.id,
          client_zone_user: client_zone_user.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(client_zone_users_path)
        expect(flash[:notice]).to eq('User was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        client_zone_user = stub_valid_client_zone_user

        process :update, method: :patch, params: {
          id: client_zone_user.id,
          client_zone_user: client_zone_user.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_client_zone_user_path(client_zone_user))
        expect(flash[:notice]).to eq('User was successfully updated.')
      end
    end

    context 'when User is invalid' do
      it 'does not redirect' do
        client_zone_user = stub_invalid_client_zone_user

        process :update, method: :patch, params: {
          id: client_zone_user.id,
          client_zone_user: client_zone_user.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_client_zone_user
    client_zone_user = build_stubbed(:client_zone_user)
    allow(ClientZone::User).to receive(:new).and_return(client_zone_user)
    allow(client_zone_user).to receive(:save).and_return(true)
    allow(ClientZone::User).to receive_message_chain(:friendly, :find).and_return(client_zone_user)
    allow(client_zone_user).to receive(:update).and_return(true)
    client_zone_user
  end

  def stub_invalid_client_zone_user
    client_zone_user = build_stubbed(:client_zone_user)
    allow(ClientZone::User).to receive(:new).and_return(client_zone_user)
    allow(client_zone_user).to receive(:save).and_return(false)
    allow(ClientZone::User).to receive_message_chain(:friendly, :find).and_return(client_zone_user)
    allow(client_zone_user).to receive(:update).and_return(false)
    client_zone_user
  end
end
