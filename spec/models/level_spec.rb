require 'spec_helper'

describe Level do
  it "has many sentences" do
    Level.new.should respond_to(:sentences)
  end

  describe "level number" do
    context "create" do
      it "should be assigned a level number after create" do
        language = Factory(:language)
        language.should_receive(:update_level_numbers)
        level = Level.create(:language => language)
      end
    end
    context "destroy" do
      it "should have the language reset its level numbers after destroy" do
        language = Factory(:language)
        language.should_receive(:update_level_numbers).twice
        level = Level.create(:language => language)
        level.destroy
      end
    end
  end
end
