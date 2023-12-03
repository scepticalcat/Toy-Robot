# frozen_string_literal: true

class Command::Right < Command
  SCOPE = :robot

  def execute robot
    robot.right
  end

  class << self
    private

    def pattern
      /^RIGHT$/i
    end
  end
end
