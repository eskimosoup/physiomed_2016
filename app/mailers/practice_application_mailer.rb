class PracticeApplicationMailer < ApplicationMailer
  def application_made(practice_application)
    @practice_application = practice_application

    mail to: site_email, subject: I18n.t('mailers.practice_application.application_made.subject')
  end
end
