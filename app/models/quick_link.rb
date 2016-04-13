class QuickLink < ActiveRecord::Base
  validates :link, presence: true
  validates :link_text, presence: true

  scope :displayed, -> { where(display: true) }
  scope :ordered_by_position, -> { order(position: :asc) }

  def employer?
    type == "EmployerQuickLink"
  end

  def employee?
    type == "EmployeeQuickLink"
  end

  def self.presenter
    QuickLinkPresenter
  end
end
