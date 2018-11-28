# == Schema Information
#
# Table name: policies_documents
#
#  id                   :integer          not null, primary key
#  policies_category_id :integer
#  position             :integer          default(0), not null
#  title                :string           not null
#  summary              :text
#  file                 :string
#  display              :boolean          default(TRUE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

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
