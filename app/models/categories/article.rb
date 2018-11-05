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

class Categories::Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :article
end
