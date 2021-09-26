FactoryBot.define do
  factory :import_error do
    import { nil }
    column { "MyString" }
    value { "MyString" }
    description { "MyString" }
  end
end
