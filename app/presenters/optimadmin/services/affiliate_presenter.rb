module Optimadmin
  class Services::AffiliatePresenter
    include Optimadmin::PresenterMethods

    presents :services_affiliate
      delegate :id, :title, to: :services_affiliate
      end
end
