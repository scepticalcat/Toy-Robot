# frozen_string_literal: true

class CommandParser
  COMMAND_NAMESPACE = Command
  private_constant :COMMAND_NAMESPACE

  class << self
    def parse input
      executor = commands.find do |candidate|
        candidate.match? input
      end

      raise CommandNotFoundError, input.to_s unless executor.present?

      executor.new(*extract_args(input))
    end

    private

    def commands
      @commands ||= COMMAND_NAMESPACE.constants.filter_map do |candidate|
        constant = COMMAND_NAMESPACE.const_get candidate

        constant if constant.is_a? Class
      end
    end

    def extract_args input
      return [] unless input.present?

      input.split(/[\s,]{1,}/).drop 1
    end
  end

  class CommandNotFoundError < StandardError; end
end
