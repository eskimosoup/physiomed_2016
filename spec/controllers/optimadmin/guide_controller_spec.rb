require 'rails_helper'

describe Optimadmin::GuidesController, type: :controller, guide: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Guide is valid' do
      it 'redirects to index on normal save' do
        guide = stub_valid_guide

        process :create, method: :post, params: {
          guide: guide.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(guides_path)
        expect(flash[:notice]).to eq('Guide was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        guide = stub_valid_guide

        process :create, method: :post, params: {
          guide: guide.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_guide_path(guide))
        expect(flash[:notice]).to eq('Guide was successfully created.')
      end
    end

    context 'when Guide is invalid' do
      it 'does not redirect' do
        guide = stub_invalid_guide

        process :create, method: :post, params: {
          guide: guide.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Guide is valid' do
      it 'redirects to index on normal save' do
        guide = stub_valid_guide

        process :update, method: :patch, params: {
          id: guide.id,
          guide: guide.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(guides_path)
        expect(flash[:notice]).to eq('Guide was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        guide = stub_valid_guide

        process :update, method: :patch, params: {
          id: guide.id,
          guide: guide.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_guide_path(guide))
        expect(flash[:notice]).to eq('Guide was successfully updated.')
      end
    end

    context 'when Guide is invalid' do
      it 'does not redirect' do
        guide = stub_invalid_guide

        process :update, method: :patch, params: {
          id: guide.id,
          guide: guide.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_guide
    guide = build_stubbed(:guide)
    allow(Guide).to receive(:new).and_return(guide)
    allow(guide).to receive(:save).and_return(true)
    allow(Guide).to receive_message_chain(:friendly, :find).and_return(guide)
    allow(guide).to receive(:update).and_return(true)
    guide
  end

  def stub_invalid_guide
    guide = build_stubbed(:guide)
    allow(Guide).to receive(:new).and_return(guide)
    allow(guide).to receive(:save).and_return(false)
    allow(Guide).to receive_message_chain(:friendly, :find).and_return(guide)
    allow(guide).to receive(:update).and_return(false)
    guide
  end
end
