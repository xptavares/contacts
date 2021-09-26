class Contact::ValidateService < ApplicationService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    return { status: :error, key: :base, error: "params cannot be nil" } unless params
    result = []
    result << Contact::Validate::NameService.call(params[:name])
    result << Contact::Validate::BirthAtService.call(params[:birth_at])
    result << Contact::Validate::PhoneService.call(params[:phone])
    result << Contact::Validate::AddressService.call(params[:address])
    result << Contact::Validate::EmailService.call(params[:email])
    result << Contact::Validate::CreditCardService.call(params[:credit_card_number])
    result
  end
end
