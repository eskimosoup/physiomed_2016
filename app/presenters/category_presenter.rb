class CategoryPresenter < BasePresenter
  presents :category
  delegate :id, to: :category
end
