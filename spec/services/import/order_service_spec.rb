require "rails_helper"

RSpec.describe Import::OrderService do
  let!(:column_one) { create(:column, key: "one", name: "One") }
  let!(:column_two) { create(:column, key: "two", name: "Two") }
  let!(:import) { create(:import) }
  let!(:import_column_one) { create(:import_column, import: import, column: column_one, order: 1) }
  let!(:import_column_two) { create(:import_column, import: import, column: column_two, order: 2) }

  let(:service) { Import::OrderService.call(import.reload.id) }

  it { expect(service).to eq({ one: 1, two: 2 }) }
end
