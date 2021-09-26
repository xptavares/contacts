FactoryBot.define do
  factory :lead do
    user { nil }
    name { "MyString" }
    birth_at { "2021-09-26" }
    phone { "MyString" }
    address { "MyString" }
    franchise { "MyString" }
    encrypted_credit_card_number { "MyString" }
    email { "MyString" }
  end
end
