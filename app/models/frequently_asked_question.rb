class FrequentlyAskedQuestion < ActiveRecord::Base
  validates :answer, presence: true
  validates :question, presence: true

  scope :displayed, ->{ where(display: true) }
end
