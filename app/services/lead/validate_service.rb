class Lead::ValidateService < ApplicationService
  attr_reader :params, :current_user_id

  def initialize(current_user_id, params)
    @current_user_id = current_user_id
    @params = params
  end

  def call
    return { status: :error, key: :email, error: :uniq } if validate_uniq?
    { status: :ok }
  end

  private
  def validate_uniq?
    current_user.leads.where(email: params[:email]).exists?
  end

  def current_user
    @current_user ||= User.find(current_user_id)
  end
end
