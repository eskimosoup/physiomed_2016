module Optimadmin
  module Policies
    class DocumentPresenter
      include Optimadmin::PresenterMethods

        presents :document
        delegate :id, :title, to: :document
    end
  end
end
