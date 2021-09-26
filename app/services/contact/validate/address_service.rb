class Contact::Validate::AddressService < Contact::Validate::BaseService
  service_key :address

  private
  def valid?
    attr.present?
  end
end
