# frozen_string_literal: true

RSpec.shared_context "with IO" do
  let(:stdin) { StringIO.new }
  let(:stdout) { StringIO.new }

  let(:input) { nil }

  before do
    [*input].each { |command| stdin.puts command } unless input.nil?

    stdin.puts "EXIT"

    stdin.rewind
  end
end
