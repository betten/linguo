require 'spec_helper'

describe Level do
  it "has many sentences" do
    Level.new.should respond_to(:sentences)
  end
end
