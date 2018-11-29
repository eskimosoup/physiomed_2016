module Optimadmin
  class OfferingPresenter
    include Optimadmin::PresenterMethods

    presents :offering
      delegate :id, :title, to: :offering
      end
end
