# == Schema Information
#
# Table name: services_categories
#
#  id                 :integer          not null, primary key
#  position           :integer          default(0), not null
#  parent_id          :integer
#  colour             :string
#  title              :string           not null
#  summary            :text
#  content            :text
#  display            :boolean          default(TRUE)
#  style              :string           default("basic")
#  suggested_url      :string
#  slug               :string           not null
#  homepage_highlight :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Services::Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
