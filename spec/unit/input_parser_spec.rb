# frozen_string_literal: true

RSpec.describe InputParser do
  subject { described_class }

  describe "#parse" do
    [nil, ""].each do |value|
      context "when `input` is #{value.nil? ? 'nil' : 'blank'}" do
        it "raises an ArgumentError" do
          expect { subject.parse(value) }.to raise_error(ArgumentError, "input cannot be nil or blank")
        end
      end
    end

    context "when `input` contains only a command" do
      let (:input) { a_string.upcase }

      it "contains the specified command" do
        expect(subject.parse(input)).to match [input]
      end

      ["lowercase", "MixedCase"].each do |command|
        context "and `input` is #{command}" do
          let (:input) { command }

          it "is normalized" do
            expect(subject.parse(input)).to match [input.upcase]
          end
        end
      end
    end

    context "when `input` contains a command and 'n' arguments" do
      let (:input) { "COMMAND #{arguments.join ','}" }

      let (:arguments) { Array.new(a_number(min: 2, max: 5)) { a_string.upcase } }

      it "contains the command and all given arguments" do
        expect(subject.parse(input)).to include *arguments
      end

      ["lowercase", "MixedCase"].each do |argument|
        context "and arguments are #{argument}" do
          let (:arguments) { [argument] }

          it "normalises all arguments" do
            expect(subject.parse(input)).to include argument.upcase
          end
        end
      end

      context "when there is additional whitespace separating the command and arguments" do
        let (:input) { "COMMAND       #{arguments.join ','}" }

        it "is ignored" do
          expect(subject.parse(input)).to match ["COMMAND", *arguments]
        end
      end
      
      context "when there is additional whitespace separating arguments" do
        let (:input) { "COMMAND #{arguments.join ', '}" }

        it "is ignored" do
          expect(subject.parse(input)).to match ["COMMAND", *arguments]
        end
      end
    end
  end
end
