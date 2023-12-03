# frozen_string_literal: true

class Command::Left < Command
  SCOPE = :robot

  def execute robot
    robot.left
  end

  class << self
    private

    def pattern
      /^LEFT$/i
    end
  end
end
