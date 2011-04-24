require 'spec_helper'

describe "vocabs/new.html.haml" do
  before(:each) do
    assign(:vocab, stub_model(Vocab,
      :english => "MyString",
      :foreign => "MyString",
      :level => nil
    ).as_new_record)
  end

  it "renders new vocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabs_path, :method => "post" do
      assert_select "input#vocab_english", :name => "vocab[english]"
      assert_select "input#vocab_foreign", :name => "vocab[foreign]"
      assert_select "input#vocab_level", :name => "vocab[level]"
    end
  end
end
