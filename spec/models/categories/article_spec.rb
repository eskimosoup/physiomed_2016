# == Schema Information
#
# Table name: categories_articles
#
#  id          :integer          not null, primary key
#  category_id :integer
#  article_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Categories::Article, type: :model do
  describe 'validations' do
    it { should belong_to :category }
    it { should belong_to :article }
  end
end
