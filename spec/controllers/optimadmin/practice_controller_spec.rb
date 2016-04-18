require 'rails_helper'

describe Optimadmin::PracticesController, type: :controller, practice: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Practice is valid' do
      it 'redirects to index on normal save' do
        practice = stub_valid_practice

        process :create, method: :post, params: {
          practice: practice.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(practices_path)
        expect(flash[:notice]).to eq('Practice was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        practice = stub_valid_practice

        process :create, method: :post, params: {
          practice: practice.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_practice_path(practice))
        expect(flash[:notice]).to eq('Practice was successfully created.')
      end
    end

    context 'when Practice is invalid' do
      it 'does not redirect' do
        practice = stub_invalid_practice

        process :create, method: :post, params: {
          practice: practice.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Practice is valid' do
      it 'redirects to index on normal save' do
        practice = stub_valid_practice

        process :update, method: :patch, params: {
          id: practice.id,
          practice: practice.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(practices_path)
        expect(flash[:notice]).to eq('Practice was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        practice = stub_valid_practice

        process :update, method: :patch, params: {
          id: practice.id,
          practice: practice.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_practice_path(practice))
        expect(flash[:notice]).to eq('Practice was successfully updated.')
      end
    end

    context 'when Practice is invalid' do
      it 'does not redirect' do
        practice = stub_invalid_practice

        process :update, method: :patch, params: {
          id: practice.id,
          practice: practice.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_practice
    practice = build_stubbed(:practice)
    allow(Practice).to receive(:new).and_return(practice)
    allow(practice).to receive(:save).and_return(true)
    allow(Practice).to receive_message_chain(:friendly, :find).and_return(practice)
    allow(practice).to receive(:update).and_return(true)
    practice
  end

  def stub_invalid_practice
    practice = build_stubbed(:practice)
    allow(Practice).to receive(:new).and_return(practice)
    allow(practice).to receive(:save).and_return(false)
    allow(Practice).to receive_message_chain(:friendly, :find).and_return(practice)
    allow(practice).to receive(:update).and_return(false)
    practice
  end
end
