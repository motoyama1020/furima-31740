FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    first_name            { Faker::Name.first_name }
    last_name             { Faker::Name.last_name }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'ヤマダ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
