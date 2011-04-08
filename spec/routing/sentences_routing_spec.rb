require "spec_helper"

describe SentencesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/levels/1/sentences" }.should route_to(:controller => "sentences", :action => "index", :level_id => "1")
    end

    it "recognizes and generates #new" do
      { :get => "/levels/1/sentences/new" }.should route_to(:controller => "sentences", :action => "new", :level_id => "1")
    end

    it "recognizes and generates #show" do
      { :get => "/levels/1/sentences/1" }.should route_to(:controller => "sentences", :action => "show", :level_id => "1", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/levels/1/sentences/1/edit" }.should route_to(:controller => "sentences", :action => "edit", :level_id => "1", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/levels/1/sentences" }.should route_to(:controller => "sentences", :action => "create", :level_id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/levels/1/sentences/1" }.should route_to(:controller => "sentences", :action => "update", :level_id => "1", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/levels/1/sentences/1" }.should route_to(:controller => "sentences", :action => "destroy", :level_id => "1", :id => "1")
    end

  end
end
