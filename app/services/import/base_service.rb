class Import::BaseService < ApplicationService
  attr_reader :id

  def initialize(id)
    @id = id
  end

  private
  def import
    @import ||= Import.find(id)
  end
end
