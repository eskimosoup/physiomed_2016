require 'rails_helper'

describe Optimadmin::ClientsController, type: :controller, client: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Client is valid' do
      it 'redirects to index on normal save' do
        client = stub_valid_client

        process :create, method: :post, params: {
          client: client.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(clients_path)
        expect(flash[:notice]).to eq('Client was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        client = stub_valid_client

        process :create, method: :post, params: {
          client: client.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_client_path(client))
        expect(flash[:notice]).to eq('Client was successfully created.')
      end
    end

    context 'when Client is invalid' do
      it 'does not redirect' do
        client = stub_invalid_client

        process :create, method: :post, params: {
          client: client.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Client is valid' do
      it 'redirects to index on normal save' do
        client = stub_valid_client

        process :update, method: :patch, params: {
          id: client.id,
          client: client.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(clients_path)
        expect(flash[:notice]).to eq('Client was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        client = stub_valid_client

        process :update, method: :patch, params: {
          id: client.id,
          client: client.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_client_path(client))
        expect(flash[:notice]).to eq('Client was successfully updated.')
      end
    end

    context 'when Client is invalid' do
      it 'does not redirect' do
        client = stub_invalid_client

        process :update, method: :patch, params: {
          id: client.id,
          client: client.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_client
    client = build_stubbed(:client)
    allow(Client).to receive(:new).and_return(client)
    allow(client).to receive(:save).and_return(true)
    allow(Client).to receive_message_chain(:friendly, :find).and_return(client)
    allow(client).to receive(:update).and_return(true)
    client
  end

  def stub_invalid_client
    client = build_stubbed(:client)
    allow(Client).to receive(:new).and_return(client)
    allow(client).to receive(:save).and_return(false)
    allow(Client).to receive_message_chain(:friendly, :find).and_return(client)
    allow(client).to receive(:update).and_return(false)
    client
  end
end
