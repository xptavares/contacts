FactoryBot.define do
  factory :import do
    status { 1 }
    file { Rack::Test::UploadedFile.new(Rails.root.join("spec", "fixtures", "files", "contacts.csv"), "text/csv") }
  end
end
