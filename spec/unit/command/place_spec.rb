# frozen_string_literal: true

RSpec.describe Command::Place do
  describe "SCOPE" do
    subject { described_class.new 0, 0, "NORTH" }

    it "is :robot scoped" do
      expect(subject.scope).to eq :robot
    end
  end

  describe "#execute" do
    subject { described_class.new x, y, facing }

    let(:x) { a_number }
    let(:y) { a_number }
    let(:facing) { "NORTH" }

    let(:robot) { Robot.new(Table.new) }

    it "delegates the call to the given robot" do
      expect(robot).to receive(:place).with x, y, facing

      subject.execute robot
    end
  end

  describe ".match?" do
    subject { described_class }

    context "when input is 'PLACE'" do
      it "is true" do
        expect(subject.match?("PLACE 0, 0, NORTH")).to be true
      end

      it "is case insensitive" do
        expect(subject.match?("place 0, 0, north")).to be true
      end
    end

    context "when an incorrect number of arguments are provided to 'PLACE'" do
      it "is false" do
        expect(subject.match?("PLACE 0, 0")).to be false
      end
    end

    context "when invalid arguments are provided to 'PLACE'" do
      it "is false" do
        expect(subject.match?("PLACE x, y, NORTH")).to be false
      end
    end
  end
end
