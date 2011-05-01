require 'spec_helper'

describe Vocab do
  it "should not be valid without an english" do
    v = Vocab.new
    v.foreign = 'test'
    v.should_not be_valid
  end

  it "should not be valid without a foreign" do
    v = Vocab.new
    v.english = 'test'
    v.should_not be_valid
  end
end
