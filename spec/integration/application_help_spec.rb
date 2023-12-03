# frozen_string_literal: true

RSpec.describe Application do
  context "when command is 'HELP" do
    include_context "with IO"

    let(:input) { "HELP" }

    it "displays the help text" do
      Application.new(stdin, stdout).start
    rescue SystemExit
      expect(stdout.string).to include <<~HELP
        Available commands:
          - PLACE X, Y, F   | Place the robot on the table at X, Y with facing F
          - MOVE            | Move the robot one space forward
          - LEFT            | Rotate the robot left
          - RIGHT           | Rotate the robot right
          - REPORT          | Get a report of the robot's current position and facing
          - HELP            | Display this help
          - EXIT            | Exit the simulation
      HELP
    end
  end
end
