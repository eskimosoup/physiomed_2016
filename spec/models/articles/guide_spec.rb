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

require 'rails_helper'

RSpec.describe Articles::Guide, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
