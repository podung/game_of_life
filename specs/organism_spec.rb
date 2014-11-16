require 'rspec'
require 'rspec/its'

require_relative '../app/organism.rb'

describe Organism do
  let(:initial_life_status) { true }

  subject { described_class.new(initial_life_status) }

  describe "intialization" do
    context "starting alive" do
      its(:alive?) { should be true }
    end

    context "starting dead" do
      let(:initial_life_status) { false }
      its(:alive?) { should be false }
    end
  end

  describe "kill!" do
    before do
      subject.kill!
    end

    its(:alive?) { should be false }
  end

  describe "resurrect!" do
    before do
      subject.kill!
      subject.resurrect!
    end

    its(:alive?) { should be true }
  end
end

