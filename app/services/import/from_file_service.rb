class Import::FromFileService < Import::BaseService
  def call
    import.processing!
    begin
      headers = Import::OrderService.call(import.id)
      ::CSV.parse(import.file.download, headers: false) do |row|
        hash = {
          name: row[headers[:name]],
          birth_at: row[headers[:birth_at]],
          phone: row[headers[:birth_at]],
          address: row[headers[:birth_at]],
          credit_card_number: row[headers[:birth_at]],
          email: row[headers[:birth_at]]
        }

        puts hash
      end
    rescue StandardError => e
      import.failed!
    end
    import.finished!
  end
end
