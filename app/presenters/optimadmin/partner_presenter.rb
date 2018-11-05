module Optimadmin
  class PartnerPresenter
    include Optimadmin::PresenterMethods

    presents :partner
      delegate :id, :title, to: :partner
      end
end
