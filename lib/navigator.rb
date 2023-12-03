# frozen_string_literal: true

require "matrix"

class Navigator
  COMPASS = {
    "NORTH" => [1, 0],
    "EAST" => [0, 1],
    "SOUTH" => [-1, 0],
    "WEST" => [0, -1]
  }.freeze

  CARDINAL_DIRECTIONS = COMPASS.keys

  private_constant :CARDINAL_DIRECTIONS, :COMPASS

  def initialize x, y, facing # rubocop:disable Naming/MethodParameterName
    raise ArgumentError, "invalid coordinates" unless coordinate_valid?(x) && coordinate_valid?(y)
    raise ArgumentError, "facing must be one of #{CARDINAL_DIRECTIONS.join ', '}" unless facing_valid? facing

    @position = Vector[Integer(x), Integer(y)]
    @facing = facing
  end

  def left
    @facing = CARDINAL_DIRECTIONS[current_index - 1]
  end

  def next
    position + Vector[*COMPASS[facing]]
  end

  def right
    index = current_index + 1

    @facing = CARDINAL_DIRECTIONS[index < CARDINAL_DIRECTIONS.length ? index : 0]
  end

  def to_s
    x = position[0]
    y = position[1]

    "#{x}, #{y}, #{facing}"
  end

  private

  attr_reader :facing, :position

  def coordinate_valid? value
    value.is_a?(Integer) || value.to_i.to_s == value
  end

  def current_index
    CARDINAL_DIRECTIONS.index facing
  end

  def facing_valid? value
    CARDINAL_DIRECTIONS.include? value
  end
end
