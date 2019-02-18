# == Schema Information
#
# Table name: policies_categories
#
#  id              :integer          not null, primary key
#  position        :integer          default(0), not null
#  title           :string           not null
#  documents_count :integer          default(0)
#  display         :boolean          default(TRUE)
#  suggested_url   :string
#  slug            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Policies::Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
