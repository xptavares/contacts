json.extract! lead, :id, :user_id, :name, :birth_at, :phone, :address, :franchise, :encrypted_credit_card_number, :email, :created_at, :updated_at
json.url lead_url(lead, format: :json)
