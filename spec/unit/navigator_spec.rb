# frozen_string_literal: true

RSpec.describe Navigator do
  describe "#initialize" do
    subject { described_class }

    context "when x is not like an integer" do
      let(:x) { a_string }

      it "raises an ArgumentError" do
        expect { subject.new x, 0, "NORTH" }.to raise_error ArgumentError, "invalid coordinates"
      end
    end

    context "when y is not like an integer" do
      let(:y) { a_string }

      it "raises an ArgumentError" do
        expect { subject.new 0, y, "NORTH" }.to raise_error ArgumentError, "invalid coordinates"
      end
    end

    context "when facing is not represented by the cardinal directions" do
      let(:facing) { a_string }

      it "raises an ArgumentError" do
        expect { subject.new 0, 0, facing }
          .to raise_error ArgumentError, "facing must be one of NORTH, EAST, SOUTH, WEST"
      end
    end
  end

  describe "#left" do
    subject { described_class.new 0, 0, facing }

    before do
      subject.left
    end

    context "when facing is 'NORTH" do
      let(:facing) { "NORTH" }

      it "changes facing to 'WEST'" do
        expect(subject.to_s).to include "WEST"
      end
    end

    context "when facing is 'EAST" do
      let(:facing) { "EAST" }

      it "changes facing to 'NORTH'" do
        expect(subject.to_s).to include "NORTH"
      end
    end

    context "when facing is 'SOUTH" do
      let(:facing) { "SOUTH" }

      it "changes facing to 'EAST'" do
        expect(subject.to_s).to include "EAST"
      end
    end

    context "when facing is 'WEST" do
      let(:facing) { "WEST" }

      it "changes facing to 'SOUTH'" do
        expect(subject.to_s).to include "SOUTH"
      end
    end
  end

  describe "#next" do
    subject { described_class.new x, y, facing }

    let(:x) { 0 }
    let(:y) { 0 }

    context "when facing is 'NORTH'" do
      let(:facing) { "NORTH" }

      it "increments x by 1" do
        expect(subject.next).to eq Vector[x + 1, y]
      end
    end

    context "when facing is 'EAST'" do
      let(:facing) { "EAST" }

      it "increments y by 1" do
        expect(subject.next).to eq Vector[x, y + 1]
      end
    end

    context "when facing is 'SOUTH'" do
      let(:facing) { "SOUTH" }

      it "decrements x by 1" do
        expect(subject.next).to eq Vector[x - 1, y]
      end
    end

    context "when facing is 'WEST'" do
      let(:facing) { "WEST" }

      it "decrements y by 1" do
        expect(subject.next).to eq Vector[x, y - 1]
      end
    end
  end

  describe "#right" do
    subject { described_class.new 0, 0, facing }

    before do
      subject.right
    end

    context "when facing is 'NORTH" do
      let(:facing) { "NORTH" }

      it "changes facing to 'EAST'" do
        expect(subject.to_s).to include "EAST"
      end
    end

    context "when facing is 'EAST" do
      let(:facing) { "EAST" }

      it "changes facing to 'SOUTH'" do
        expect(subject.to_s).to include "SOUTH"
      end
    end

    context "when facing is 'SOUTH" do
      let(:facing) { "SOUTH" }

      it "changes facing to 'WEST'" do
        expect(subject.to_s).to include "WEST"
      end
    end

    context "when facing is 'WEST" do
      let(:facing) { "WEST" }

      it "changes facing to 'NORTH'" do
        expect(subject.to_s).to include "NORTH"
      end
    end
  end

  describe "#to_s" do
    subject { described_class.new x, y, facing }

    let(:x) { a_number }
    let(:y) { a_number }
    let(:facing) { "NORTH" }

    it "concatenates the coordinates and facing" do
      expect(subject.to_s).to eq "#{x}, #{y}, #{facing}"
    end
  end
end
