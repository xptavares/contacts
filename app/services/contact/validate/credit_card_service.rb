class Contact::Validate::CreditCardService < Contact::Validate::BaseService
  service_key :credit_card

  private
  def valid?
    attr.present?
  end
end
