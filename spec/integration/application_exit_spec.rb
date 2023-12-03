# frozen_string_literal: true

RSpec.describe Application do
  context "when command is 'EXIT'" do
    include_context "with IO"

    it "prints 'Bye! and exits'" do
      Application.new(stdin, stdout).start
    rescue SystemExit
      expect(stdout.string).to include "Bye!"
    end
  end
end
