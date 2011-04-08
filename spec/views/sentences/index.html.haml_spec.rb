require 'spec_helper'

describe "sentences/index.html.haml" do
  before(:each) do
    assign(:sentences, [
      stub_model(Sentence,
        :english => "MyText",
        :foreign => "MyText",
        :level => nil
      ),
      stub_model(Sentence,
        :english => "MyText",
        :foreign => "MyText",
        :level => nil
      )
    ])
  end

  it "renders a list of sentences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
