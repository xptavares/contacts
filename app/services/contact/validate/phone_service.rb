class Contact::Validate::PhoneService < Contact::Validate::BaseService
  service_key :phone

  private
  def valid?
    !!(attr =~ /^\(\+\d{2}\)\ \d{3}\ \d{3}\ \d{2}\ \d{2}\ \d{2}$/)
  end
end
