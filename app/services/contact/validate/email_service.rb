class Contact::Validate::EmailService < Contact::Validate::BaseService
  service_key :email

  private
  def valid?
    !!(attr =~ Devise.email_regexp)
  end
end
