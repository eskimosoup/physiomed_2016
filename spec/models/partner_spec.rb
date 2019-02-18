# == Schema Information
#
# Table name: partners
#
#  id          :integer          not null, primary key
#  position    :integer
#  title       :string
#  summary     :text
#  content     :text
#  image       :string
#  website_url :string
#  display     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Partner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
