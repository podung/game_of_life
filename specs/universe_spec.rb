require 'rspec'
require 'rspec/its'

require_relative '../app/universe.rb'

describe Universe do

  def format_grid(grid)
    grid.map { |row|
      row.map { |cell| cell.alive? ? "#" : " " }.join
    }.join("\n")
  end

  subject { described_class.new(starting_grid) }

  context "when newly instantiated" do
    let(:starting_grid) { " # \n" +
                          "  #" }

    let(:expected_grid) { " # \n" +
                          "  #" }

    it "converts starting input into grid of organisms" do
      expect(format_grid(subject.grid)).to eq expected_grid
    end
  end

  describe "tick" do
    before do
      subject.tick
    end

    context "when less than 2 neighbors" do
      let(:starting_grid) { " ## \n" +
                            "    \n" +
                            "  # \n" }

      let(:expected_grid) { "    \n" +
                            "    \n" +
                            "    " }

      it "should kill cells" do
        expect(format_grid(subject.grid)).to eq expected_grid
      end
    end

    context "when 2 or three neighbors" do
      let(:starting_grid) { "    \n" +
                            " ## \n" +
                            " ## \n" +
                            "    \n" }

      let(:expected_grid) { "    \n" +
                            " ## \n" +
                            " ## \n" +
                            "    " }


      it "should not kill cells" do
        expect(format_grid(subject.grid)).to eq expected_grid
      end
    end
  end
end
