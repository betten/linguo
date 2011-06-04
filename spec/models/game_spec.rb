require 'spec_helper'

describe Game do

  describe "next level" do
    before do
      @levels = [
        Factory(:level, :number => 1), 
        Factory(:level, :number => 2), 
        Factory(:level, :number => 3)
      ]
      @game = Factory(:game, :language => Factory(:language, :levels => @levels))
      @game.stub_chain(:language, :levels, :where).with(hash_including(:number)) { |hash|
        @levels.find_all{ |level| level.number == hash[:number] }
      }
    end

    describe "has_next_level" do
      it "should return true if there is a next level" do
        @game.level = @levels[1]
        @game.has_next_level?.should be
      end

      it "should return false if there is not a next level" do
        @game.level = @levels.last
        @game.has_next_level?.should_not be
      end

    end

    describe "goto_next_level" do
      it "should set the current level to the next level by number" do
        @game.level = @levels[1]
        lambda { 
          @game.goto_next_level 
        }.should change(@game, :level).from(@levels[1]).to(@levels[2])
      end

      it "should maintain the current level if there is no next level" do
        @game.level = @levels.last
        lambda { 
          @game.goto_next_level 
        }.should_not change(@game, :level)
      end
    end
  end

  describe "current_level" do
    before do
      @language = Factory(:language, :levels => [Factory(:level)])
    end

    it "should not set the current level if level is nil and the language has no levels" do
      game = Factory(:game)
      game.level.should be_nil
    end

    it "should set the current level to the languages first level if no current level" do
      game = Factory(:game, :language => @language)
      game.current_level.should == @language.levels.first
    end

    it "should return the current level if current level exists" do
      game = Factory(:game, :language => @language, :level => Factory(:level, :number => 4))
      game.current_level.number.should == 4
    end
  end

  describe "current_level?" do
    it "should return true if game has a level" do
      game = Factory(:game, :level => Factory(:level))
      game.current_level?.should be
    end

    it "should return false if game does not have a level" do
      game = Factory(:game)
      game.current_level?.should_not be
    end
  end

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
