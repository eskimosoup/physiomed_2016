# == Schema Information
#
# Table name: landing_pages_articles
#
#  id              :integer          not null, primary key
#  article_id      :integer
#  landing_page_id :integer
#  display         :boolean          default(TRUE), not null
#  position        :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

module LandingPages
  class Article < ActiveRecord::Base
    belongs_to :article
    belongs_to :landing_page
  end
end
