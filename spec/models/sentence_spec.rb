require 'spec_helper'

describe Sentence do
  it "should not be valid without an english" do
    s = Sentence.new
    s.foreign = 'test'
    s.should_not be_valid
  end

  it "should not be valid without a foreign" do
    s = Sentence.new
    s.english = 'test'
    s.should_not be_valid
  end
end
