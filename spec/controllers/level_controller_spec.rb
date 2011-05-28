require 'spec_helper'

describe LevelController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'challenge'" do
    it "should be successful" do
      get 'challenge'
      response.should be_success
    end
  end

end
