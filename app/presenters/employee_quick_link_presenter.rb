class EmployeeQuickLinkPresenter < BasePresenter
  presents :employee_quick_link
  delegate :id, to: :employee_quick_link
end
