# == Schema Information
#
# Table name: services
#
#  id             :integer          not null, primary key
#  position       :integer          default(0)
#  title          :string           not null
#  colour         :string
#  summary        :text
#  content        :text
#  image          :string
#  display        :boolean          default(TRUE)
#  slug           :string           not null
#  suggested_url  :string
#  style          :string           default("basic"), not null
#  layout         :string           default("application"), not null
#  sections_count :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Service, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
