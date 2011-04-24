require 'spec_helper'

describe "vocabs/show.html.haml" do
  before(:each) do
    @vocab = assign(:vocab, stub_model(Vocab,
      :english => "English",
      :foreign => "Foreign",
      :level => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/English/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Foreign/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
