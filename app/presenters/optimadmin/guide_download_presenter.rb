module Optimadmin
  class GuideDownloadPresenter
    include Optimadmin::PresenterMethods

    presents :guide_download
    delegate :id, :name, :job_title, :phone, :guide,
             :utm_source, :utm_campaign, :utm_term, to: :guide_download

    def email
      h.mail_to guide_download.email
    end

    def created_at
      h.l guide_download.created_at, format: :short
    end
  end
end
