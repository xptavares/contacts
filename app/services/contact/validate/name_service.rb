class Contact::Validate::NameService < Contact::Validate::BaseService
  service_key :name

  private
  def valid?
    special = "?<>',?[]}{=@)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
    (attr =~ regex).nil?
  end
end
