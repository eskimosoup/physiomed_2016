# == Schema Information
#
# Table name: banners
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  image       :string           not null
#  position    :integer          default(0), not null
#  display     :boolean          default(TRUE), not null
#  summary     :text
#  link        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  button_text :string           default("Read more")
#

class Banner < ActiveRecord::Base
  mount_uploader :image, BannerUploader

  validates :title, presence: true
  validates :image, presence: true

  scope :displayed, -> { where(display: true) }
  scope :ordered_by_position, -> { order(position: :asc) }

end
