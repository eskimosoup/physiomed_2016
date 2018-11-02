# == Schema Information
#
# Table name: seo_entries
#
#  id               :integer          not null, primary key
#  nominal_url      :string
#  title            :string
#  meta_description :text
#  in_sitemap       :boolean          default(TRUE)
#  created_at       :datetime
#  updated_at       :datetime
#

class SeoEntry < ActiveRecord::Base
end
