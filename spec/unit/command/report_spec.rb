# frozen_string_literal: true

RSpec.describe Command::Report do
  describe "SCOPE" do
    subject { described_class.new }

    it "is :robot scoped" do
      expect(subject.scope).to eq :robot
    end
  end

  describe "#execute" do
    subject { described_class.new }

    let(:robot) { Robot.new(Table.new) }

    let(:report) { a_string }

    before do
      allow(robot).to receive(:report).and_return report
    end

    it "delegates the call to the given robot" do
      expect(subject.execute(robot)).to eq report
    end
  end

  describe ".match?" do
    subject { described_class }

    context "when input is 'REPORT'" do
      it "is true" do
        expect(subject.match?("REPORT")).to be true
      end

      it "is case insensitive" do
        expect(subject.match?("report")).to be true
      end
    end

    context "when input is anything other than 'REPORT'" do
      it "is false" do
        expect(subject.match?(a_string)).to be false
      end
    end

    context "when an argument is provided to 'REPORT'" do
      it "is false" do
        expect(subject.match?("REPORT #{a_string}")).to be false
      end
    end
  end
end
