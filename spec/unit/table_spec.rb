# frozen_string_literal: true

RSpec.describe Table do
  describe "#initialize" do
    context "when rows is nil" do
      it "raises an OutOfBoundsError" do
        expect { Table.new rows: nil, columns: 1 }.to raise_error(Table::OutOfBoundsError, "dimensions cannot be nil")
      end
    end

    context "when columns is nil" do
      it "raises an OutOfBoundsError" do
        expect { Table.new rows: 1, columns: nil }.to raise_error(Table::OutOfBoundsError, "dimensions cannot be nil")
      end
    end

    context "when rows is less than 1" do
      let(:rows) { 1 - a_number }

      it "raises an OutOfBoundsError" do
        expect { Table.new rows:, columns: 1 }.to raise_error(Table::OutOfBoundsError, "out of bounds (#{rows}, 1)")
      end
    end

    context "when columns is less than 1" do
      let(:columns) { 1 - a_number }

      it "raises an OutOfBoundsError" do
        expect { Table.new rows: 1, columns: }.to raise_error(Table::OutOfBoundsError, "out of bounds (1, #{columns})")
      end
    end
  end

  describe "#position_valid?" do
    context "using defaults" do
      subject { Table.new }

      let(:default_max_bounds) { 4 }

      context "when x and y are both 0" do
        it "is true" do
          expect(subject.position_valid?(0, 0)).to be true
        end
      end

      context "when x and y are both 4" do
        it "is true" do
          expect(subject.position_valid?(default_max_bounds, default_max_bounds)).to be true
        end
      end

      context "when either x or y are less than 0" do
        it "is false" do
          expect(subject.position_valid?(-1, -1)).to be false
        end
      end

      context "when either x or y are greater than 4" do
        it "is false" do
          expect(subject.position_valid?(default_max_bounds + 1, default_max_bounds + 1)).to be false
        end
      end
    end
  end
end
