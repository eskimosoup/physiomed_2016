# == Schema Information
#
# Table name: articles
#
#  id                       :integer          not null, primary key
#  title                    :string           not null
#  summary                  :text             not null
#  content                  :text             not null
#  image                    :string
#  date                     :date             not null
#  display                  :boolean          default(TRUE), not null
#  home_highlight           :boolean          default(TRUE), not null
#  author_id                :integer
#  slug                     :string
#  url_originally_posted_on :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  display_on_client_zone   :boolean          default(FALSE)
#

require "rails_helper"

RSpec.describe Article do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:date) }
    it do
      article = build(:article)
      expect(article).to validate_uniqueness_of(:title) 
    end
  end

  describe "associations" do
    it { should belong_to(:author).class_name("TeamMember") }
    it { should have_many(:categories_articles).class_name("Categories::Article") }
    it { should have_many(:categories).through(:categories_articles) }
  end
end
