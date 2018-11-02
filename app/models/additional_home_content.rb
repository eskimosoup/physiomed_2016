# == Schema Information
#
# Table name: additional_home_contents
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  content_type :string           not null
#  video_id     :integer
#  content      :text
#  position     :integer          default(0), not null
#  display      :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class AdditionalHomeContent < ActiveRecord::Base

  CONTENT_TYPES = %w( savings_calculator text_content video_content ).freeze
  belongs_to :video
  
  validates :content, presence: true, if: :text?
  validates :content_type, presence: true, inclusion: { in: CONTENT_TYPES }
  validates :title, presence: true
  validates :video, presence: true, if: :video?

  scope :displayed, -> { where(display: true) }
  scope :ordered_by_position, -> { order(position: :asc) }

  def video?
    content_type == "video_content"
  end

  def text?
    content_type == "text_content"
  end

  def savings_calculator?
    content_type == "savings_calculator"
  end

  def to_partial_path
    "additional_home_contents/#{ content_type }"
  end
end
