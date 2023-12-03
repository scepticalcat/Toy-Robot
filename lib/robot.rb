# frozen_string_literal: true

require "active_support/core_ext/object/blank"

class Robot
  def initialize table
    @table = table
  end

  def left
    position&.left

    nil
  end

  def move
    return unless position.present?

    update_position position.next

    nil
  end

  def place x, y, facing # rubocop:disable Naming/MethodParameterName
    update_position Navigator.new(x, y, facing)

    nil
  rescue ArgumentError
    "Invalid placement"
  end

  def report
    return "" unless position.present?

    position.to_s
  end

  def right
    position&.right

    nil
  end

  private

  attr_reader :position, :table

  def update_position candidate
    return unless table.position_valid?(*candidate.position)

    @position = candidate
  end
end
