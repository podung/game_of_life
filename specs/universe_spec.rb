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

end
