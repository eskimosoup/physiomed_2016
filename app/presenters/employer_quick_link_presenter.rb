class EmployerQuickLinkPresenter < BasePresenter
  presents :employer_quick_link
  delegate :id, to: :employer_quick_link
end
