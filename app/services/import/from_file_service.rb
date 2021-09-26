class Import::FromFileService < Import::BaseService
  def call
    import.processing!
    begin
      headers = Import::OrderService.call(import.id)
      ::CSV.parse(import.file.download, headers: false) do |row|
        hash = {
          name: row[headers[:name] - 1],
          birth_at: row[headers[:birth_at] - 1],
          phone: row[headers[:phone] - 1],
          address: row[headers[:address] - 1],
          credit_card_number: row[headers[:credit_card_number] - 1],
          email: row[headers[:email] - 1]
        }

        valid = Contact::ValidateService.call(hash)

        puts "-" * 100
        puts valid
      end
    rescue StandardError => e
      import.failed!
    end
    import.finished!
  end
end
