FactoryBot.define do
  factory :buy_address do
    post_num { '123-4567' }
    prefecture_id { 3 }
    city { '東京都' }
    house_num { '１ー１' }
    building { '東京ハイツ' }
    phone { 200000000 }
  end
end
