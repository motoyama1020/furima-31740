FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name                        { Faker::Internet.password(min_length: 40) }
    explanation                 { Faker::Internet.password(min_length: 1000) }
    category_id                 { Faker::Number.between(from: 2, to: 11) }
    status_id                   { Faker::Number.between(from: 2, to: 7) }
    burden_id                   { Faker::Number.between(from: 2, to: 3) }
    prefecture_id               { Faker::Number.between(from: 2, to: 48) }
    day_id                      { Faker::Number.between(from: 2, to: 4) }
    price                       { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
