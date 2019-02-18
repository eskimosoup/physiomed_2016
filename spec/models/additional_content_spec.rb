# == Schema Information
#
# Table name: additional_contents
#
#  id         :integer          not null, primary key
#  area       :string
#  title      :string
#  content    :text
#  display    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AdditionalContent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
