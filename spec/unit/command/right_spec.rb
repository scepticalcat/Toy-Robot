# frozen_string_literal: true

RSpec.describe Command::Right do
  describe "SCOPE" do
    subject { described_class.new }

    it "is :robot scoped" do
      expect(subject.scope).to eq :robot
    end
  end

  describe "#execute" do
    subject { described_class.new }

    let(:robot) { Robot.new(Table.new) }

    it "delegates the call to the given robot" do
      expect(robot).to receive :right

      subject.execute robot
    end
  end

  describe ".match?" do
    subject { described_class }

    context "when input is 'RIGHT'" do
      it "is true" do
        expect(subject.match?("RIGHT")).to be true
      end

      it "is case insensitive" do
        expect(subject.match?("right")).to be true
      end
    end

    context "when input is anything other than 'RIGHT'" do
      it "is false" do
        expect(subject.match?(a_string)).to be false
      end
    end

    context "when an argument is provided to 'RIGHT'" do
      it "is false" do
        expect(subject.match?("RIGHT #{a_string}")).to be false
      end
    end
  end
end
