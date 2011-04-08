require 'spec_helper'

describe "sentences/show.html.haml" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :english => "MyText",
      :foreign => "MyText",
      :level => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
