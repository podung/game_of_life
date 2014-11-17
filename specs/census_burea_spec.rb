require 'rspec'
require 'rspec/its'

require_relative '../app/census_burea.rb'

describe CensusBureau do
  let(:upper_left)    { double "upper_left" }
  let(:upper_middle)  { double "upper_middle" }
  let(:upper_right)   { double "upper_right" }
  let(:middle_left)   { double "middle_left" }
  let(:middle_middle) { double "middle_middle" }
  let(:middle_right)  { double "middle_right" }
  let(:bottom_left)   { double "bottom_left" }
  let(:bottom_middle) { double "bottom_middle" }
  let(:bottom_right)  { double "bottom_right" }

  let(:grid) { [[upper_left,  upper_middle,  upper_right],
                [middle_left, middle_middle, middle_right],
                [bottom_left, bottom_middle, bottom_right]] }


  describe "neighbors_for" do
    subject { described_class.new(grid).neighbors_for(row, column) }

    context "when surrounded on all sides" do
      let(:row) { 1 }
      let(:column) { 1 }
      its(:count) { should be 8 }
      it { should include upper_left }
      it { should include upper_middle }
      it { should include upper_right }
      it { should include middle_left }
      it { should include middle_right }
      it { should include bottom_left }
      it { should include bottom_middle }
      it { should include bottom_right }
    end

    context "when in the top row" do
      let(:row) { 0 }
      let(:column) { 1 }
      its(:count) { should be 5 }
      it { should include upper_left }
      it { should include upper_right }
      it { should include middle_left }
      it { should include middle_right }
      it { should include middle_middle }
    end

    context "when in the bottom row" do
      let(:row) { 2 }
      let(:column) { 1 }
      its(:count) { should be 5 }
      it { should include middle_left }
      it { should include middle_right }
      it { should include middle_middle }
      it { should include bottom_left }
      it { should include bottom_right }
    end
  end
end
