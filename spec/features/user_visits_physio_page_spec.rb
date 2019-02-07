require 'rails_helper'

RSpec.feature 'user visits physio page' do
  scenario 'successfully' do
    username = ENV['PHYSIOMED_2016_PHYSIO_USERNAME']
    password = ENV['PHYSIOMED_2016_PHYSIO_PASSWORD']
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
    page.driver.header('Authorization', credentials)

    visit physios_path

    expect(page).to have_content 'Physio Network - Videos'
  end
end
