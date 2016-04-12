require 'rails_helper'

describe Optimadmin::BodyPartsController, type: :controller, body_part: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Body part is valid' do
      it 'redirects to index on normal save' do
        body_part = stub_valid_body_part

        post :create, { 
          body_part: body_part.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(body_parts_path)
        expect(flash[:notice]).to eq('Body part was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        body_part = stub_valid_body_part

        post :create, {
          body_part: body_part.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_body_part_path(body_part))
        expect(flash[:notice]).to eq('Body part was successfully created.')
      end
    end

    context 'when Body part is invalid' do
      it 'does not redirect' do
        body_part = stub_invalid_body_part

        post :create, {
          body_part: body_part.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Body part is valid' do
      it 'redirects to index on normal save' do
        body_part = stub_valid_body_part

        patch :update, {
          id: body_part.id,
          body_part: body_part.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(body_parts_path)
        expect(flash[:notice]).to eq('Body part was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        body_part = stub_valid_body_part

        patch :update, {
          id: body_part.id,
          body_part: body_part.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_body_part_path(body_part))
        expect(flash[:notice]).to eq('Body part was successfully updated.')
      end
    end

    context 'when Body part is invalid' do
      it 'does not redirect' do
        body_part = stub_invalid_body_part

        patch :update, {
          id: body_part.id,
          body_part: body_part.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_body_part
    body_part = build_stubbed(:body_part)
    allow(BodyPart).to receive(:new).and_return(body_part)
    allow(body_part).to receive(:save).and_return(true)
    allow(BodyPart).to receive_message_chain(:friendly, :find).and_return(body_part)
    allow(body_part).to receive(:update).and_return(true)
    body_part
  end

  def stub_invalid_body_part
    body_part = build_stubbed(:body_part)
    allow(BodyPart).to receive(:new).and_return(body_part)
    allow(body_part).to receive(:save).and_return(false)
    allow(BodyPart).to receive_message_chain(:friendly, :find).and_return(body_part)
    allow(body_part).to receive(:update).and_return(false)
    body_part
  end
end
