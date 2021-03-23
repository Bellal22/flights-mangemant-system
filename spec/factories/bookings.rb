FactoryBot.define do
  factory :booking do
    fullname { "MyString" }
    flight { nil }
    aeroplane { nil }
    seat { nil }
    paid { 1 }
  end
end
