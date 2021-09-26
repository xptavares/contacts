class ImporterWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user_id, import_id)
    Import::FromFileService.call(user_id, import_id)
  end
end
