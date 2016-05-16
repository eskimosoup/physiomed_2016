require 'rails_helper'

RSpec.describe ArticlePresenter, type: :presenter, article: true do
  let(:article) { build(:article) }
  subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
