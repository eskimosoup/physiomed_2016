require 'rails_helper'

describe Optimadmin::CategoriesController, type: :controller, category: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Category is valid' do
      it 'redirects to index on normal save' do
        category = stub_valid_category

        process :create, method: :post, params: {
          category: category.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        category = stub_valid_category

        process :create, method: :post, params: {
          category: category.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_category_path(category))
        expect(flash[:notice]).to eq('Category was successfully created.')
      end
    end

    context 'when Category is invalid' do
      it 'does not redirect' do
        category = stub_invalid_category

        process :create, method: :post, params: {
          category: category.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Category is valid' do
      it 'redirects to index on normal save' do
        category = stub_valid_category

        process :update, method: :patch, params: {
          id: category.id,
          category: category.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        category = stub_valid_category

        process :update, method: :patch, params: {
          id: category.id,
          category: category.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_category_path(category))
        expect(flash[:notice]).to eq('Category was successfully updated.')
      end
    end

    context 'when Category is invalid' do
      it 'does not redirect' do
        category = stub_invalid_category

        process :update, method: :patch, params: {
          id: category.id,
          category: category.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_category
    category = build_stubbed(:category)
    allow(Category).to receive(:new).and_return(category)
    allow(category).to receive(:save).and_return(true)
    allow(Category).to receive_message_chain(:friendly, :find).and_return(category)
    allow(category).to receive(:update).and_return(true)
    category
  end

  def stub_invalid_category
    category = build_stubbed(:category)
    allow(Category).to receive(:new).and_return(category)
    allow(category).to receive(:save).and_return(false)
    allow(Category).to receive_message_chain(:friendly, :find).and_return(category)
    allow(category).to receive(:update).and_return(false)
    category
  end
end
