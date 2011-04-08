require 'spec_helper'

describe "sentences/new.html.haml" do
  before(:each) do
    assign(:sentence, stub_model(Sentence,
      :english => "MyText",
      :foreign => "MyText",
      :level => nil
    ).as_new_record)
  end

  it "renders new sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sentences_path, :method => "post" do
      assert_select "textarea#sentence_english", :name => "sentence[english]"
      assert_select "textarea#sentence_foreign", :name => "sentence[foreign]"
      assert_select "input#sentence_level", :name => "sentence[level]"
    end
  end
end
