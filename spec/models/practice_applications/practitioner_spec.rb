# == Schema Information
#
# Table name: practice_applications_practitioners
#
#  id                 :integer          not null, primary key
#  practice_id        :integer
#  name               :string
#  qualification_date :date
#  years_practicing   :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe PracticeApplications::Practitioner, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
