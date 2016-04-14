class AdditionalHomeContentPresenter < BasePresenter
  presents :additional_home_content
  delegate :id, to: :additional_home_content
end
