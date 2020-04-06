FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'asdasdasd' }

    email { Faker::Internet.email }
  end
end
