class PracticeApplicationMailer < ApplicationMailer
  def application_made(practice_application, file_path, file_name)
    @practice_application = practice_application
    attachments[file_name] = File.read(file_path)
    mail to: practice_application_email, subject: I18n.t('mailers.practice_application.application_made.subject')
  end

  private

  def practice_application_email
    setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: 'Practice Application Email')
    setting.value
  rescue NoMethodError => e
    Rails.logger.error "Practice Application Email Site Setting does not exist"
    site_email
  end
end
