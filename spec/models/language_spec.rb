require 'spec_helper'

describe Language do
  describe "update_level_numbers" do

    before do
      @language = Factory(:language)
    end

    context "one or more of the languages levels has a nil number" do
      before do
        [5, nil, 2, nil, 8].each do |n|
          @language.levels << Factory(:level, :language => @language, :number => n)
        end
      end

      it "should set level numbers for all levels" do
        @language.update_level_numbers
        @language.levels.map(&:number).should_not include(nil)
      end

      it "should result in sorted 1..n level numbers" do
        @language.update_level_numbers
        @language.levels.sort.map(&:number).should == (1..@language.levels.count).to_a
      end
    end

    context "language level numbers are unsorted" do
      before do
        (1..10).to_a.sort_by{ rand }.each do |n|
          @language.levels << Factory(:level, :language => @language, :number => n)
        end
      end

      it "should set level numbers for all levels" do
        @language.update_level_numbers
        @language.levels.map(&:number).should_not include(nil)
      end

      it "should result in sorted 1..n level numbers" do
        @language.update_level_numbers
        @language.levels.sort.map(&:number).should == (1..@language.levels.count).to_a
      end
    end

    context "language level numbers are already sorted 1..n" do
      before do
        (1..10).to_a.each do |n|
          @language.levels << Factory(:level, :language => @language, :number => n)
        end
      end

      it "should set level numbers for all levels" do
        @language.update_level_numbers
        @language.levels.map(&:number).should_not include(nil)
      end

      it "should result in sorted 1..n level numbers" do
        @language.update_level_numbers
        @language.levels.sort.map(&:number).should == (1..@language.levels.count).to_a
      end
    end
  end
end
