FactoryBot.define do
  factory :lead_error do
    lead { nil }
    column { "MyString" }
    value { "MyString" }
    description { "MyString" }
  end
end
