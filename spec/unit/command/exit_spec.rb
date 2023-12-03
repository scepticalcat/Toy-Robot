# frozen_string_literal: true

RSpec.describe Command::Exit do
  describe "SCOPE" do
    subject { described_class.new }

    it "is :application scoped" do
      expect(subject.scope).to eq :application
    end
  end

  describe "#execute" do
    subject { described_class.new }

    it "raise a Terminated exception" do
      expect { subject.execute }.to raise_error Terminated
    end
  end

  describe ".match?" do
    subject { described_class }

    context "when input is 'EXIT'" do
      it "is true" do
        expect(subject.match?("EXIT")).to be true
      end

      it "is case insensitive" do
        expect(subject.match?("exit")).to be true
      end
    end

    context "when input is anything other than 'EXIT'" do
      it "is false" do
        expect(subject.match?(a_string)).to be false
      end
    end

    context "when an argument is provided to 'EXIT'" do
      it "is false" do
        expect(subject.match?("EXIT #{a_string}")).to be false
      end
    end
  end
end
