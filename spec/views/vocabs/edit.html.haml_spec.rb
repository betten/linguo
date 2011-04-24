require 'spec_helper'

describe "vocabs/edit.html.haml" do
  before(:each) do
    @vocab = assign(:vocab, stub_model(Vocab,
      :english => "MyString",
      :foreign => "MyString",
      :level => nil
    ))
  end

  it "renders the edit vocab form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vocabs_path(@vocab), :method => "post" do
      assert_select "input#vocab_english", :name => "vocab[english]"
      assert_select "input#vocab_foreign", :name => "vocab[foreign]"
      assert_select "input#vocab_level", :name => "vocab[level]"
    end
  end
end
