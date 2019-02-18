# == Schema Information
#
# Table name: case_studies
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  image          :string
#  summary        :text             not null
#  content        :text             not null
#  date           :date             not null
#  client_id      :integer
#  display        :boolean          default(TRUE), not null
#  home_highlight :boolean          default(TRUE), not null
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class CaseStudy < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  mount_uploader :image, CaseStudyUploader

  belongs_to :client
  belongs_to :displayed_client, -> { merge(Client.displayed) }, 
    class_name: "Client", foreign_key: :client_id
  has_many :categories_case_studies, class_name: "Categories::CaseStudy"
  has_many :categories, through: :categories_case_studies
  has_many :testimonials

  scope :search, ->(keywords){ where("title ILIKE ?", "%#{ keywords }%") if keywords.present? }
  scope :displayed, ->{ where(display: true) }
  scope :for_home, ->{ where(home_highlight: true) }
  scope :for_category, ->(category) { joins(:categories_case_studies).where(categories_case_studies: { category_id: category }) }

  validates :content, presence: true
  validates :summary, presence: true
  validates :title, presence: true, uniqueness: true
end
