require "rails_helper"

RSpec.describe PracticeApplicationMailer, type: :mailer do
  describe '#application_made' do
    it 'renders the headers' do
      practice_application_email = create(
        :site_setting, 
        key: 'Practice Application Email',
        value: 'physio@physiomed.co.uk'
      )
      site_email =  create(
        :site_setting, 
        key: 'Email',
        value: 'support@physiomed.co.uk'
      )

      application = build(:practice_applications_practice)
      mail = PracticeApplicationMailer.application_made(application)

      expect(mail.subject).to eq(I18n.t('mailers.practice_application.application_made.subject'))
      expect(mail.to).to eq([practice_application_email.value])
      expect(mail.from).to eq([site_email.value])
    end

    it 'defaults to site email if practice application email not set' do
      site_email =  create(
        :site_setting, 
        key: 'Email',
        value: 'support@physiomed.co.uk'
      )

      application = build(:practice_applications_practice)
      mail = PracticeApplicationMailer.application_made(application)

      expect(mail.to).to eq([site_email.value])
    end

    it 'renders the body' do
      application = build(:practice_applications_practice, name: "My Little Physio")
      contact = build(:practice_applications_contact, name: "Jeff Fisher")
      practitioner = build(:practice_applications_practitioner, practice: application, name: "Joe Bloggs")
      allow(application).to receive(:contacts).and_return([contact])
      allow(application).to receive(:practitioners).and_return([practitioner])
      mail = PracticeApplicationMailer.application_made(application)

      expect(mail.body.encoded).to match(application.name)
      expect(mail.body.encoded).to match(contact.name)
      expect(mail.body.encoded).to match(practitioner.name)
    end

  end
end
