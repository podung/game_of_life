require 'rspec'
require 'rspec/its'

require_relative '../app/census_bureau.rb'

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

  let(:upper_row)  { [upper_left,  upper_middle,  upper_right] }
  let(:middle_row) { [middle_left, middle_middle, middle_right] }
  let(:bottom_row) { [bottom_left, bottom_middle, bottom_right] }

  let(:grid) {[ upper_row,
                middle_row,
                bottom_row ]}

  context "when initialized with a non-rectangle board" do
    before do
      bottom_row.pop
    end

    it "should blow up" do
      expect { described_class.new(grid) }.to raise_error "invalid starting grid"
    end
  end

  describe "neighbors_for" do
    subject { described_class.new(grid).neighbors_for(test_cell) }

    context "when surrounded on all sides" do
      let(:test_cell) { middle_middle }
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
      let(:test_cell) { upper_middle }
      its(:count) { should be 5 }
      it { should include upper_left }
      it { should include upper_right }
      it { should include middle_left }
      it { should include middle_right }
      it { should include middle_middle }
    end

    context "when in the bottom row" do
      let(:test_cell) { bottom_middle }
      its(:count) { should be 5 }
      it { should include middle_left }
      it { should include middle_right }
      it { should include middle_middle }
      it { should include bottom_left }
      it { should include bottom_right }
    end

    context "when in the left column" do
      let(:test_cell) { middle_left }
      its(:count) { should be 5 }
      it { should include upper_left }
      it { should include upper_middle }
      it { should include middle_middle }
      it { should include bottom_left }
      it { should include bottom_middle }
    end

    context "when in the right column" do
      let(:test_cell) { middle_right }
      its(:count) { should be 5 }
      it { should include upper_right }
      it { should include upper_middle }
      it { should include middle_middle }
      it { should include bottom_right }
      it { should include bottom_middle }
    end

    context "when spot checking top right" do
      let(:test_cell) { upper_right }
      its(:count) { should be 3 }
      it { should include upper_middle }
      it { should include middle_middle }
      it { should include middle_right }
    end

    context "when spot checking bottom left" do
      let(:test_cell) { bottom_left }
      its(:count) { should be 3 }
      it { should include middle_left }
      it { should include middle_middle }
      it { should include bottom_middle }
    end
  end
end
