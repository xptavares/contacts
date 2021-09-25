class Import::OrderService < Import::BaseService
  def call
    import.import_columns.map do |import_column|
      [import_column.column.key.to_sym, import_column.order]
    end.to_h
  end
end
