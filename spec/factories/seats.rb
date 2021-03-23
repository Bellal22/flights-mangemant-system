FactoryBot.define do
  factory :seat do
    flight { nil }
    category { nil }
    pnr { "MyString" }
    price { 1 }
  end
end
