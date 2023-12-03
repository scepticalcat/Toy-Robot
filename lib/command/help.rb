# frozen_string_literal: true

class Command::Help < Command
  def execute
    <<~HELP
      Available commands:
        - PLACE X, Y, F   | Place the robot on the table at X, Y with facing F
        - MOVE            | Move the robot one space forward
        - LEFT            | Rotate the robot left
        - RIGHT           | Rotate the robot right
        - REPORT          | Get a report of the robot's current position and facing
        - HELP            | Display this help
        - EXIT            | Exit the simulation
    HELP
  end

  class << self
    private

    def pattern
      /^HELP$/i
    end
  end
end
