# frozen_string_literal: true

require "active_support/core_ext/object/blank"

class InputParser
  class << self
    def parse input
      return [] unless input.present?

      input.split(/[\s,]{1,}/).collect(&:upcase)
    end
  end
end
