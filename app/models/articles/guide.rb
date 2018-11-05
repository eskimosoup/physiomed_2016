# == Schema Information
#
# Table name: articles_guides
#
#  id         :integer          not null, primary key
#  article_id :integer
#  guide_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Articles::Guide < ActiveRecord::Base
  belongs_to :article, class_name: '::Article'
  belongs_to :guide, class_name: '::Guide'
end
