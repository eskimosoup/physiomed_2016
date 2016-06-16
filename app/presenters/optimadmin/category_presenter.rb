module Optimadmin
  class CategoryPresenter
    include Optimadmin::PresenterMethods

    presents :category
    delegate :id, :name, to: :category
  end
end
