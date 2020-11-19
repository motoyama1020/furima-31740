FactoryBot.define do
  factory :buy_address do
    post_num { '123-4567' }
    prefecture_id { 3 }
    city { '東京都' }
    house_num { '１ー１' }
    building { '東京ハイツ' }
    phone { 2_000_000_000 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
