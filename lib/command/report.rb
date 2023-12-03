# frozen_string_literal: true

class Command::Report < Command
  SCOPE = :robot

  def execute robot
    robot.report
  end

  class << self
    private

    def pattern
      /^REPORT$/i
    end
  end
end
