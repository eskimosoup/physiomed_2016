require "rails_helper"

RSpec.describe JobApplicationMailer, type: :mailer do
  describe '#application_made' do
    it 'renders the headers' do
      site_email =  create(
        :site_setting, 
        key: 'Email',
        value: 'support@physiomed.co.uk'
      )
      job_listing = build(:job_listing, title: "Job Listing A")
      job_application = build(
        :job_application, 
        name: "John F. Kennedy", 
        telephone: "478",
        email: "john@example.com"
      )
      mail = JobApplicationMailer.application_made(job_application, job_listing)

      expect(mail).to have_subject(I18n.t('mailers.job_application.application_made.subject'))
      expect(mail).to deliver_to(ENV['JOB_APPLICATION_EMAIL'])
      expect(mail).to deliver_from(site_email.value)
    end

    it 'renders the body' do
      site_email =  create(
        :site_setting, 
        key: 'Email',
        value: 'support@physiomed.co.uk'
      )
      job_listing = build(:job_listing, title: "Job Listing A")
      job_application = build(
        :job_application, 
        name: "John F. Kennedy", 
        telephone: "478",
        email: "john@example.com"
      )
      mail = JobApplicationMailer.application_made(job_application, job_listing)

      expect(mail).to have_body_text(job_listing.title)
      expect(mail).to have_body_text(job_application.name)
      expect(mail).to have_body_text(job_application.telephone)
      expect(mail).to have_body_text(job_application.email)
    end

  end
end
