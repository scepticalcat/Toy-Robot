# frozen_string_literal: true

RSpec.describe CommandParser do
  subject { described_class }

  describe "#parse" do
    [nil, ""].each do |value|
      context "when `input` is #{value.nil? ? 'nil' : 'blank'}" do
        it "raises CommandNotFoundError" do
          expect { subject.parse(value) }.to raise_error CommandParser::CommandNotFoundError
        end
      end
    end

    context "when input does not match any available commands" do
      it "raises CommandNotFoundError" do
        expect { subject.parse(a_string) }.to raise_error CommandParser::CommandNotFoundError
      end
    end
  end
end
