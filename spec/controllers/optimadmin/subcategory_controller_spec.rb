require 'rails_helper'

RSpec.describe Optimadmin::SubcategoriesController, type: :controller, subcategory: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Subcategory is valid' do
      it 'redirects to index on normal save' do
        subcategory = stub_valid_subcategory

        process :create, method: :post, params: {
          subcategory: subcategory.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(subcategories_path)
        expect(flash[:notice]).to eq('Subcategory was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        subcategory = stub_valid_subcategory

        process :create, method: :post, params: {
          subcategory: subcategory.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_subcategory_path(subcategory))
        expect(flash[:notice]).to eq('Subcategory was successfully created.')
      end
    end

    context 'when Subcategory is invalid' do
      it 'does not redirect' do
        subcategory = stub_invalid_subcategory

        process :create, method: :post, params: {
          subcategory: subcategory.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Subcategory is valid' do
      it 'redirects to index on normal save' do
        subcategory = stub_valid_subcategory

        process :update, method: :patch, params: {
          id: subcategory.id,
          subcategory: subcategory.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(subcategories_path)
        expect(flash[:notice]).to eq('Subcategory was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        subcategory = stub_valid_subcategory

        process :update, method: :patch, params: {
          id: subcategory.id,
          subcategory: subcategory.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_subcategory_path(subcategory))
        expect(flash[:notice]).to eq('Subcategory was successfully updated.')
      end
    end

    context 'when Subcategory is invalid' do
      it 'does not redirect' do
        subcategory = stub_invalid_subcategory

        process :update, method: :patch, params: {
          id: subcategory.id,
          subcategory: subcategory.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_subcategory
    subcategory = build_stubbed(:subcategory)
    allow(Subcategory).to receive(:new).and_return(subcategory)
    allow(subcategory).to receive(:save).and_return(true)
    allow(Subcategory).to receive_message_chain(:friendly, :find).and_return(subcategory)
    allow(subcategory).to receive(:update).and_return(true)
    subcategory
  end

  def stub_invalid_subcategory
    subcategory = build_stubbed(:subcategory)
    allow(Subcategory).to receive(:new).and_return(subcategory)
    allow(subcategory).to receive(:save).and_return(false)
    allow(Subcategory).to receive_message_chain(:friendly, :find).and_return(subcategory)
    allow(subcategory).to receive(:update).and_return(false)
    subcategory
  end
end
