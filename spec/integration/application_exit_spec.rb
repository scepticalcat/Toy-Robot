# frozen_string_literal: true

RSpec.describe Application do
  context "when command is 'EXIT'" do
    include_context "with IO"

    # let(:stdin) { StringIO.new }
    # let(:stdout) { StringIO.new }

    # before do
    #   stdin.puts "EXIT"

    #   stdin.rewind
    # end

    it "prints 'Bye! and exits'" do
      Application.start stdin, stdout
    rescue SystemExit
      expect(stdout.string).to include "Bye!"
    end
  end
end
