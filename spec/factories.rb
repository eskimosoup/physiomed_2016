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

  factory :article do
    sequence(:title){|n| "MyString #{ n }" }
    summary "MyText"
    content "MyText"
    image "MyString"
    date { Date.today }
    display true
    home_highlight true
    author nil

    trait :with_image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end

    factory :article_with_image, traits: [:with_image]
  end

  factory :banner do
    sequence(:title) { |n| "Banner #{ n }" }
    image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    position 1
    display true
    summary "MyText"
    link "http://www.google.co.uk"
  end

  factory :body_part do
    name { BodyPart::BODY_PARTS.sample }
    tagline "MyString"
    position 1
    display true
  end

  factory :body_part_section do
    body_part nil
    title "MyString"
    sub_title "MyString"
    content "MyText"
    image "MyString"
    display true
    position 0
  end

  factory :case_study do
    sequence(:title) {|n| "Title #{ n }" }
    trait :image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end
    summary "MyText"
    content "MyText"
    date { Date.today }
    client nil
    display true
    home_highlight true
    factory :case_study_with_image, traits: [:image]
  end

  factory :client do
    sequence(:name) {|n| "Name #{ n }" }
    logo { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    position 1
    display true
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

  factory :frequently_asked_question do
    question "MyString"
    answer "MyText"
    display true
    position 1
  end

  factory :guide do
    title "MyString"
    content "MyText"
    file { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    display true

    trait :image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end

    factory :guide_with_image, traits: [:image]
  end

  factory :health_zone do
    sequence(:title) { |n| "Health Zone #{ n }" }
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

  factory :people_helped_section do
    sequence(:title) {|n| "MyString #{ n }" }
    section { PeopleHelpedSection::SECTIONS.sample }
    number 1
    content "MyText"
    link "http://www.google.co.uk"
    display true
  end

  factory :practice do
    name "MyString"
    address "MyString"
    town "MyString"
    county "MyString"
    post_code "HU1 1NQ"
    latitude 53.7457
    longitude 0.3367
    display true
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

  factory :team_member do
    forename "MyString"
    surname "MyString"
    bio "MyText"
    email "example@example.com"
    phone "01234 567 890"
    role "MyString"

    trait :image do
      image { File.open(File.join(Rails.root, "spec/support/images/landscape_image.jpg")) }
    end

    factory :team_member_with_image, traits: [:image]
  end

  factory :testimonial do
    title "MyString"
    content "MyText"
    role "MyString"
    author "MyString"
    case_study nil
    display true
  end

  factory :video do
    title "My Video"
    subtitle "Some subtitle"
    content "some content"
    youtube_identifier "tIdIqbv7SPo"
    display true
  end
end
