class Import::FromFileService < Import::BaseService
  def call
    import.processing!
    begin
      ::CSV.parse(import.file.download, headers: false) do |row|
        ActiveRecord::Base.transaction do
          hash = mapped_values(row)
          contact_validates = Contact::ValidateService.call(hash)
          lead = Lead::CreateService.call(current_user.id, import.id, hash)
          contact_validates.each do |contact_validate|
            next if contact_validate[:status] == :ok
            LeadError.create(lead: lead,
                            column: contact_validate[:key],
                            value: hash[contact_validate[:key]],
                            description: contact_validate[:error])
          end
        end
      end
    rescue StandardError => e
      import.failed!
    end
    import.finished!
  end

  private
  def mapped_values(row)
    headers = Import::OrderService.call(current_user.id, import.id)
    {
      name: row[headers[:name] - 1],
      birth_at: row[headers[:birth_at] - 1],
      phone: row[headers[:phone] - 1],
      address: row[headers[:address] - 1],
      credit_card_number: row[headers[:credit_card_number] - 1],
      email: row[headers[:email] - 1]
    }
  end
end
