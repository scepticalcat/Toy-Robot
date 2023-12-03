# frozen_string_literal: true

class Command::Exit < Command
  def execute
    raise Terminated
  end

  class << self
    private

    def pattern
      /^EXIT$/i
    end
  end
end
