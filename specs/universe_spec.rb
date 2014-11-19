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

    context "when less than 2 cells" do
      it "should kill cells" do
        expect(subject.grid.flatten).to all(eq Organism.new(false))
      end
    end
  end
end
