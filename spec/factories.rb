FactoryGirl.define do
  factory :employer_quick_link, class: EmployerQuickLink do
    link "MyString"
    link_text "MyString"
    position 1
    display true
  end
  
  factory :employee_quick_link, class: EmployeeQuickLink do
    link "MyString"
    link_text "MyString"
    position 1
    display true
  end

  factory :administrator, class: Optimadmin::Administrator do
    username 'optimised'
    email 'support@optimised.today'
    password 'optipoipoip'
    password_confirmation 'optipoipoip'
    role 'master'
  end

  factory :banner do
    title "MyString"
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    position 1
    display true
    summary "MyText"
    link "http://www.google.co.uk"
  end

  factory :body_part do
    name { BodyPart::BODY_PARTS.sample }
    introduction "MyText"
    display true
    sequence(:mobile_position) {|n| n }
  end

  factory :site_setting, class: Optimadmin::SiteSetting do
    environment "test"
    trait :name do
      key 'Name'
      value 'Site Name'
    end

    trait :email do
      key 'Email'
      value 'support@optimised.today'
    end
    factory :site_setting_name, traits: [:name]
    factory :site_setting_email, traits: [:email]
  end
end
