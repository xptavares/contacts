require "bcrypt"

class Lead::CreateService < ApplicationService
  attr_reader :params, :current_user_id, :import_id

  def initialize(current_user_id, import_id, params)
    @current_user_id = current_user_id
    @import_id = import_id
    @params = params
  end

  def call
    if valid[:status] == :ok
      { status: :ok, body: Lead.create(prepare_params) }
    else
      valid
    end
  end

  private

  def valid
    @valid ||= Lead::ValidateService.call(current_user_id, params)
  end

  def prepare_params
    {
      user_id: current_user_id,
      import_id: import_id,
      franchise: franchise,
      credit_card_last_numbers: credit_card_last_numbers,
      encrypted_credit_card_number: encrypted_credit_card_number,
      name: params[:name],
      birth_at: params[:birth_at],
      phone: params[:phone],
      address: params[:address],
      email: params[:email]
    }
  end

  def franchise
    detector = CreditCardValidations::Detector.new(params[:credit_card_number])
    detector.brand
  end

  def credit_card_last_numbers
    return nil unless params[:credit_card_number].present?
    params[:credit_card_number].reverse[0,4].reverse
  end

  def encrypted_credit_card_number
    BCrypt::Password.create(params[:credit_card_number])
  end
end
