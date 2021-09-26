class Import::BaseService < ApplicationService
  attr_reader :id, :current_user_id

  def initialize(current_user_id, id)
    @current_user_id = current_user_id
    @id = id
  end

  private
  def import
    @import ||= current_user.imports.find(id)
  end

  def current_user
    @current_user ||= User.find(current_user_id)
  end
end
