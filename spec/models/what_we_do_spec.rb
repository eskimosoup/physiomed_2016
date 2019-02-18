# == Schema Information
#
# Table name: what_we_dos
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  content      :text
#  display      :boolean          default(TRUE), not null
#  position     :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  links_count  :integer          default(0), not null
#  pdf_download :string
#  image        :string
#

require 'rails_helper'

RSpec.describe WhatWeDo, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
  end

  describe 'associations' do
    it { should have_many(:links).class_name("WhatWeDoLink") }
  end
end
