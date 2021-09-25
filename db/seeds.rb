alexandre = User.create!(email: "xptavares@gmail.com", username: "xptavares", password: "qwerty")
["Name", "Date of Birth", "Phone", "Address", "Credit Card", "Email"].each do |column_name|
  Column.create!(name: column_name)
end
