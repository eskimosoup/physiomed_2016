class JobApplicationMailer < ApplicationMailer
  def application_made(job_application, job_listing)
    @job_application = job_application
    @job_listing = job_listing
    attachments[@job_application.cv.file.filename] = @job_application.cv.read

    mail to: ENV['JOB_APPLICATION_EMAIL'],
      subject: I18n.t('mailers.job_application.application_made.subject')
  end
end
