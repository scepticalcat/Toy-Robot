# frozen_string_literal: true

RSpec.describe Command::Help do
  describe "#execute" do
    subject { described_class.new }

    it "returns the help text" do
      expect(subject.execute).to eq <<~HELP
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

  describe ".match?" do
    subject { described_class }

    context "when input is 'HELP'" do
      it "is true" do
        expect(subject.match?("HELP")).to be true
      end

      it "is case insensitive" do
        expect(subject.match?("help")).to be true
      end
    end

    context "when input is anything other than 'HELP'" do
      it "is false" do
        expect(subject.match?(a_string)).to be false
      end
    end

    context "when an argument is provided to 'HELP'" do
      it "is false" do
        expect(subject.match?("HELP #{a_string}")).to be false
      end
    end
  end
end
