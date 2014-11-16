require 'rspec'
require 'rspec/its'

require_relative '../app/organism.rb'

describe Organism do
  context "initial state" do
    its(:alive?) { should eq true }
  end
end

