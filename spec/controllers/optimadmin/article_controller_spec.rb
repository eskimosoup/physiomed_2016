require 'rails_helper'

describe Optimadmin::ArticlesController, type: :controller, article: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Article is valid' do
      it 'redirects to index on normal save' do
        article = stub_valid_article

        post :create, {
          article: article.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(articles_path)
        expect(flash[:notice]).to eq('Article was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        article = stub_valid_article

        post :create, {
          article: article.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_article_path(article))
        expect(flash[:notice]).to eq('Article was successfully created.')
      end
    end

    context 'when Article is invalid' do
      it 'does not redirect' do
        article = stub_invalid_article

        post :create, {
          article: article.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  describe '#update' do
    context 'when Article is valid' do
      it 'redirects to index on normal save' do
        article = stub_valid_article

        patch :update, {
          id: article.id,
          article: article.attributes,
          commit: 'Save'
        }

        expect(response).to redirect_to(articles_path)
        expect(flash[:notice]).to eq('Article was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        article = stub_valid_article

        patch :update, {
          id: article.id,
          article: article.attributes,
          commit: 'Save and continue editing'
        }

        expect(response).to redirect_to(edit_article_path(article))
        expect(flash[:notice]).to eq('Article was successfully updated.')
      end
    end

    context 'when Article is invalid' do
      it 'does not redirect' do
        article = stub_invalid_article

        patch :update, {
          id: article.id,
          article: article.attributes,
          commit: 'Save'
        }

        expect(response).not_to redirect_to(:index)
      end
    end
  end

  def stub_valid_article
    article = build_stubbed(:article)
    allow(Article).to receive(:new).and_return(article)
    allow(article).to receive(:save).and_return(true)
    allow(Article).to receive_message_chain(:friendly, :find).and_return(article)
    allow(article).to receive(:update).and_return(true)
    article
  end

  def stub_invalid_article
    article = build_stubbed(:article)
    allow(Article).to receive(:new).and_return(article)
    allow(article).to receive(:save).and_return(false)
    allow(Article).to receive_message_chain(:friendly, :find).and_return(article)
    allow(article).to receive(:update).and_return(false)
    article
  end
end
