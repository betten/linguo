require "spec_helper"

describe VocabsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/vocabs" }.should route_to(:controller => "vocabs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vocabs/new" }.should route_to(:controller => "vocabs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vocabs/1" }.should route_to(:controller => "vocabs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vocabs/1/edit" }.should route_to(:controller => "vocabs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vocabs" }.should route_to(:controller => "vocabs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/vocabs/1" }.should route_to(:controller => "vocabs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vocabs/1" }.should route_to(:controller => "vocabs", :action => "destroy", :id => "1")
    end

  end
end
