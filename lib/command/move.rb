# frozen_string_literal: true

class Command::Move < Command
  SCOPE = :robot

  def execute robot
    robot.move
  end

  class << self
    private

    def pattern
      /^MOVE$/i
    end
  end
end
