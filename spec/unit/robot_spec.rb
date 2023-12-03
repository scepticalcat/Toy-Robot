# frozen_string_literal: true

# rubocop:disable Lint/AmbiguousBlockAssociation
RSpec.describe Robot do
  subject { described_class.new table }

  let(:table) { Table.new rows:, columns: }

  let(:rows) { a_number }
  let(:columns) { a_number }

  describe "#left" do
    context "when not placed" do
      it "does not alter the current state" do
        expect { subject.left }.to_not change { subject.report }
      end
    end

    context "when placed" do
      before do
        subject.place 0, 0, "NORTH"
      end

      it "alters the current state" do
        expect { subject.left }
          .to change { subject.report }
          .from("0, 0, NORTH")
          .to("0, 0, WEST")
      end
    end
  end

  describe "#move" do
    context "when not placed" do
      it "does not alter the current state" do
        expect { subject.move }.to_not change { subject.report }
      end
    end

    context "when placed" do
      before do
        subject.place x, y, "NORTH"
      end

      context "and the move is not valid" do
        let(:x) { rows }
        let(:y) { columns }

        it "does not alter the current state" do
          expect { subject.move }.to_not change { subject.report }
        end
      end

      context "and the move is valid" do
        let(:x) { a_number min: 0, max: rows - 2 }
        let(:y) { a_number min: 0, max: columns - 2 }

        it "alters the current state" do
          expect { subject.move }
            .to change { subject.report }
            .from("#{x}, #{y}, NORTH")
            .to("#{x + 1}, #{y}, NORTH")
        end
      end
    end
  end

  describe "#place" do
    context "when coordinates are invalid" do
      let(:x) { rows + 1 }
      let(:y) { columns + 1 }
      let(:facing) { "NORTH" }

      context "when not previously placed" do
        it "does not alter the current state" do
          expect { subject.place(x, y, facing) }.to_not change { subject.report }
        end
      end

      context "when previously placed" do
        before do
          subject.place 0, 0, "NORTH"
        end

        it "does not alter the current state" do
          expect { subject.place(x, y, facing) }.to_not change { subject.report }
        end
      end
    end

    context "when coordinates are valid" do
      let(:x) { a_number min: 0, max: rows - 1 }
      let(:y) { a_number min: 0, max: columns - 1 }
      let(:facing) { "NORTH" }

      context "when not previously placed" do
        it "alters the current state" do
          expect { subject.place(x, y, facing) }
            .to change { subject.report }
            .from("")
            .to("#{x}, #{y}, NORTH")
        end
      end

      context "when previously placed" do
        before do
          subject.place 0, 0, "NORTH"
        end

        it "alters the current state" do
          expect { subject.place(x, y, facing) }
            .to change { subject.report }
            .from("0, 0, NORTH")
            .to("#{x}, #{y}, NORTH")
        end
      end
    end
  end

  describe "#report" do
    context "when not placed" do
      it "is an empty string" do
        expect(subject.report).to be_empty
      end
    end

    context "when placed" do
      let(:x) { a_number min: 0, max: rows - 1 }
      let(:y) { a_number min: 0, max: columns - 1 }
      let(:facing) { "NORTH" }

      before do
        subject.place x, y, facing
      end

      it "returns the current X, Y, and Facing" do
        expect(subject.report).to eq "#{x}, #{y}, #{facing}"
      end
    end
  end

  describe "#right" do
    context "when not placed" do
      it "does not alter the current state" do
        expect { subject.right }.to_not change { subject.report }
      end
    end

    context "when placed" do
      before do
        subject.place 0, 0, "NORTH"
      end

      it "alters the current state" do
        expect { subject.right }
          .to change { subject.report }
          .from("0, 0, NORTH")
          .to("0, 0, EAST")
      end
    end
  end
end
# rubocop:enable Lint/AmbiguousBlockAssociation
