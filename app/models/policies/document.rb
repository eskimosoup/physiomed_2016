module Policies
  class Document < ActiveRecord::Base
    include OptimadminScopes

    default_scope { order(:position) }

    belongs_to :category,
               foreign_key: :policies_category_id,
               counter_cache: true

    validates :title, presence: true

    delegate :title, to: :category, prefix: true, allow_nil: true

    scope :displayed, -> { where(display: true) }

    mount_uploader :file, Policies::DocumentUploader
  end
end
