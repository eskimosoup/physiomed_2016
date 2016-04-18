class PracticePresenter < BasePresenter
  presents :practice
  delegate :id, to: :practice
end
