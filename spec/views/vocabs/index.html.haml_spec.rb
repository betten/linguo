require 'spec_helper'

describe "vocabs/index.html.haml" do
  before(:each) do
    assign(:vocabs, [
      stub_model(Vocab,
        :english => "English",
        :foreign => "Foreign",
        :level => nil
      ),
      stub_model(Vocab,
        :english => "English",
        :foreign => "Foreign",
        :level => nil
      )
    ])
  end

  it "renders a list of vocabs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "English".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Foreign".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
