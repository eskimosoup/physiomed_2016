# == Schema Information
#
# Table name: mailchimp_processors
#
#  id          :integer          not null, primary key
#  in_progress :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Mailchimp::Processor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
