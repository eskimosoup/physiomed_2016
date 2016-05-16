class ArticlePresenter < BasePresenter
  presents :article
  delegate :id, to: :article
end
