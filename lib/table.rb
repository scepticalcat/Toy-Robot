# frozen_string_literal: true

require "active_support/core_ext/object/blank"

require "matrix"

class Table
  def initialize rows: 5, columns: 5
    raise OutOfBoundsError, "dimensions cannot be nil" unless rows.present? && columns.present?
    raise OutOfBoundsError, "out of bounds (#{rows}, #{columns})" unless rows >= 1 && columns >= 1

    @matrix = Matrix.zero rows, columns
  end

  def position_valid? x, y # rubocop:disable Naming/MethodParameterName
    return false unless x >= 0 && y >= 0

    !matrix[x, y].nil?
  end

  private

  attr_reader :matrix

  class OutOfBoundsError < StandardError; end
end
