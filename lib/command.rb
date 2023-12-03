# frozen_string_literal: true

class Command
  SCOPE = :application
  private_constant :SCOPE

  def scope
    self.class.const_get :SCOPE
  end

  class << self
    def match? input
      pattern.match? input
    end

    private

    def pattern
      raise NotImplementedError, ".pattern must be implemented"
    end
  end
end
