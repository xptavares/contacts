class Contact::Validate::BirthAtService < Contact::Validate::BaseService
  service_key :birth_at

  private
  def valid?
    begin
      Date.iso8601(attr)
      true
    rescue ArgumentError => e
      false
    end
  end
end
