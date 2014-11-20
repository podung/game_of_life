require 'rspec'
require 'rspec/its'

require_relative '../app/universe.rb'

describe Universe do

  subject { described_class.new(starting_grid) }

  context "when newly instantiated" do
    let(:starting_grid) { " # \n" +
                          "  #" }

    let(:expected_grid) { [[Organism.new(false), Organism.new(true), Organism.new(false)],
                           [Organism.new(false), Organism.new(false), Organism.new(true)]] }

    it "converts starting input into grid of organisms" do
      expect(subject.grid).to eq expected_grid
    end
  end

  describe "tick" do
    before do
      subject.tick
    end

    let(:starting_grid) { " ## \n" +
                          "    \n" +
                          "  # \n" }

    context "when less than 2 neighbors" do
      it "should kill cells" do
        expect(subject.grid.flatten).to all(eq Organism.new(false))
      end
    end

    context "when 2 or three neighbors" do
      let(:starting_grid) { "    \n" +
                            " ## \n" +
                            " ## \n" +
                            "    \n" }


      it "should not kill cells" do
        expect(subject.grid.flatten.select{|org| org.alive? }.count).to eq 4
        expect(subject.grid[1]).to eq [ Organism.new(false), Organism.new(true), Organism.new(true), Organism.new(false) ]
        expect(subject.grid[2]).to eq [ Organism.new(false), Organism.new(true), Organism.new(true), Organism.new(false) ]
      end
    end
  end
end
