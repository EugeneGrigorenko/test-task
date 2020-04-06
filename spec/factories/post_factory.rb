FactoryBot.define do
  factory :post do
    title { Faker::IndustrySegments.industry }
    body { Faker::Lorem.paragraph }
    author { create(:user) }
  end
end
