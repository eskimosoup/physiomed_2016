# == Schema Information
#
# Table name: services_category_sections
#
#  id                   :integer          not null, primary key
#  services_category_id :integer
#  position             :integer          default(0)
#  title                :string
#  content              :text
#  image                :string
#  display              :boolean          default(TRUE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe Services::CategorySection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
