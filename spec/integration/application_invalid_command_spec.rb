# frozen_string_literal: true

RSpec.describe Application do
  context "when an invalid command is given" do
    include_context "with IO"

    let(:input) { a_string }

    it "prints the command not found text" do
      Application.new(stdin, stdout).start
    rescue SystemExit
      expect(stdout.string).to include "Command '#{input}' not found, try 'HELP'"
    end
  end
end
