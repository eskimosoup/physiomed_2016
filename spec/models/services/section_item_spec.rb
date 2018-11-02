# == Schema Information
#
# Table name: services_section_items
#
#  id                  :integer          not null, primary key
#  services_section_id :integer
#  position            :integer          default(0), not null
#  title               :string
#  content             :text
#  image               :string
#  style               :string           default("basic"), not null
#  display             :boolean          default(TRUE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  subtitle            :string
#  button_text         :string
#  button_link         :string
#

require 'rails_helper'

RSpec.describe Services::SectionItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
