# == Schema Information
#
# Table name: quick_links
#
#  id         :integer          not null, primary key
#  link       :string           not null
#  link_text  :string           not null
#  position   :integer          default(0), not null
#  display    :boolean          default(TRUE), not null
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmployeeQuickLink < QuickLink
end
