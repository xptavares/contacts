class ColumnController < ApplicationController
  def index
    render json: Column.all.to_json
  end
end
