module Optimadmin
  class JobListingPresenter
    include Optimadmin::PresenterMethods

    presents :job_listing
    delegate :id, :title, to: :job_listing

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format job_listing.summary
    end
  end
end
