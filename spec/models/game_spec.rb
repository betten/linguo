require 'spec_helper'

describe Game do
  describe "relationships" do
    before do
      @user = mock_model(User)
      @language = mock_model(Language)
      @level = mock_model(Level)
    end

    it "should have a user" do
      g = Game.new
      g.user = @user
      g.user.should be(@user)
    end

    it "should have a language" do
      g = Game.new
      g.language = @language
      g.language.should be(@language)
    end

    it "should have a current level" do
      g = Game.new
      g.level = @level
      g.level.should be(@level)
      g.current_level.should be(@level)
    end
  end

end
