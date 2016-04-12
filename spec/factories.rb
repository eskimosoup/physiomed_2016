FactoryGirl.define do
  factory :administrator, class: Optimadmin::Administrator do
    username 'optimised'
    email 'support@optimised.today'
    password 'optipoipoip'
    password_confirmation 'optipoipoip'
    role 'master'
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

  factory :body_part do
    name { BodyPart::BODY_PARTS.sample }
    introduction "MyText"
    display true
    sequence(:mobile_position) {|n| n }
  end
end
