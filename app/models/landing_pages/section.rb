module LandingPages
  class Section < ActiveRecord::Base
    belongs_to :landing_page, counter_cache: true

    mount_uploader :image, BodyPartSectionUploader

    scope :displayed, -> { where(display: true) }

    validates :landing_page, presence: true
    validates :content, presence: true
    validates :title, presence: true
  end
end
