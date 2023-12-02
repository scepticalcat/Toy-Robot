# frozen_string_literal: true

require "active_support/core_ext/object/blank"

class InputParser
  class << self
    def parse input
      raise ArgumentError, "input cannot be nil or blank" unless input.present?

      input.split(/[\s,]{1,}/).collect { |fragment| fragment.upcase }
    end
  end
end
