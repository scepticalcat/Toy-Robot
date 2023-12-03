# frozen_string_literal: true

RSpec.describe Application do
  context "when a blank input is given" do
    include_context "with IO"

    let(:input) { "" }

    it "does not print the command not found text" do
      Application.new(stdin, stdout).start
    rescue SystemExit
      expect(stdout.string).to_not include "Command '' not found, try 'HELP'"
    end
  end
end
