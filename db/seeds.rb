alexandre = User.create!(email: "xptavares@gmail.com", username: "xptavares", password: "qwerty")
[{
  name: "Name",
  key: "name"
},
{
  name: "Date of Birth",
  key: "birth_at"
},
{
  name: "Phone",
  key: "phone"
},
{
  name: "Address",
  key: "address"
},
{
  name: "Credit Card",
  key: "credit_card_number"
},
{
  name: "Email",
  key: "email"
}].each do |column|
  Column.create!(name: column[:name], key: column[:key])
end
