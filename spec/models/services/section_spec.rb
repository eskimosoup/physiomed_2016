# == Schema Information
#
# Table name: services_sections
#
#  id                  :integer          not null, primary key
#  service_id          :integer
#  position            :integer          default(0), not null
#  title               :string
#  content             :text
#  image               :string
#  style               :string
#  display             :boolean          default(TRUE)
#  section_items_count :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  subtitle            :string
#  button_link         :string
#  button_text         :string
#

require 'rails_helper'

RSpec.describe Services::Section, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
