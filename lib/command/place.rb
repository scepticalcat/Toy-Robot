# frozen_string_literal: true

class Command::Place < Command
  SCOPE = :robot

  def initialize x, y, facing # rubocop:disable Naming/MethodParameterName
    @x = x
    @y = y
    @facing = facing

    super()
  end

  def execute robot
    robot.place x, y, facing.upcase
  end

  private

  attr_reader :x, :y, :facing

  class << self
    private

    def pattern
      /^PLACE\s{1,}[0-9]+,\s{0,}[0-9]+,\s{0,}[a-z]+$/i
    end
  end
end
