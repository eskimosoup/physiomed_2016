# == Schema Information
#
# Table name: policies_documents
#
#  id                   :integer          not null, primary key
#  policies_category_id :integer
#  position             :integer          default(0), not null
#  title                :string           not null
#  summary              :text
#  file                 :string
#  display              :boolean          default(TRUE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe Policies::Document, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
