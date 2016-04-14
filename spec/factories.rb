FactoryGirl.define do
  factory :text_additional_home_content, class: AdditionalHomeContent do
    title "MyString"
    content_type "text_content"
    video nil
    content "MyText"
    position 1
    display true
  end

  factory :video_additional_home_content, class: AdditionalHomeContent do
    title "MyString"
    content_type "video_content"
    video nil
    content nil
    position 1
    display true
  end

  factory :savings_calculator_additional_home_content, class: AdditionalHomeContent do
    title "MyString"
    content_type "savings_calculator"
    video nil
    content nil
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
  
  factory :employee_quick_link, class: EmployeeQuickLink do
    link "MyString"
    link_text "MyString"
    position 1
    display true
  end

  factory :employer_quick_link, class: EmployerQuickLink do
    link "MyString"
    link_text "MyString"
    position 1
    display true
  end

  factory :health_zone do
    title "MyString"
    home_image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    hover_text "MyText"
    sequence(:link){|n| "http://localhost:3000/#{ n }" }
    position 1
    display true
    content "MyText"
    trait :image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end

    factory :health_zone_with_image, traits: [:image]
  end

  factory :service_standard do
    icon { ServiceStandard::ICONS.sample }
    content "MyText"
    hover_content "MyText"
    position 1
    display true
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

  factory :video do
    title "My Video"
    youtube_identifier "tIdIqbv7SPo"
    display true
  end
end
