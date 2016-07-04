class SubcategoryPresenter < BasePresenter
  presents :subcategory
  delegate :id, to: :subcategory
end
