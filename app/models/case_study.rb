class CaseStudy < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  mount_uploader :image, CaseStudyUploader

  belongs_to :client
  
  validates :content, presence: true
  validates :summary, presence: true
  validates :title, presence: true, uniqueness: true

  scope :order_by, ->(order_param){ order(order_param || { date: :desc }) }
  scope :search, ->(keywords){ where("title ILIKE ?", "%#{ keywords }%") if keywords.present? }
  scope :displayed, ->{ where(display: true) }
  scope :for_home, ->{ where(home_highlight: true) }
end
