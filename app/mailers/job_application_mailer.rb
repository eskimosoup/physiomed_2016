class JobApplicationMailer < ApplicationMailer
  def application_made(job_application, job_listing)
    @job_application = job_application
    @job_listing = job_listing
    attachments[@job_application.cv.file.filename] = @job_application.cv.read

    mail to: job_application_email,
         subject: "#{job_listing.title} - #{I18n.t('mailers.job_application.application_made.subject')}"
  end

  private

  def job_application_email
    setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: 'Job Application Email')
    setting.value
  rescue NoMethodError => e
    Rails.logger.error 'Job Application Email Site Setting does not exist'
    site_email
  end
end
