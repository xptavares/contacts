require "rails_helper"

RSpec.describe Lead::CreateService do
  let(:user) { create(:user) }
  let!(:column_one) { create(:column, key: "one", name: "One") }
  let!(:column_two) { create(:column, key: "two", name: "Two") }
  let!(:import) { create(:import, user: user) }
  let!(:import_column_one) { create(:import_column, import: import, column: column_one, order: 1) }
  let!(:import_column_two) { create(:import_column, import: import, column: column_two, order: 2) }

  let(:call) { Lead::CreateService.call(user;id, import.id, params) }

  it { expect(service).to eq({ one: 1, two: 2 }) }
end
