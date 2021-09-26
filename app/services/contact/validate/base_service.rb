class Contact::Validate::BaseService < ApplicationService
  class_attribute :service_attr

  attr_reader :attr

  def self.service_key(value)
    self.service_attr = value
  end

  def initialize(attr)
    @attr = attr
  end

  def call
    return { status: :ok, key: self.service_attr } if valid?
    { status: :error, key: self.service_attr, error: "with invalid format" }
  end

  private
  def valid?
    raise "not implemented yet"
  end
end
