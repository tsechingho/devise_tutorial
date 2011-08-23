require 'spec_helper'

describe "books/index.html.erb" do
  before(:each) do
    assign(:books, [
      stub_model(Book,
        :url => "Url",
        :title => "Title",
        :excerpt => "Excerpt",
        :author => nil
      ),
      stub_model(Book,
        :url => "Url",
        :title => "Title",
        :excerpt => "Excerpt",
        :author => nil
      )
    ])
  end

  it "renders a list of books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Excerpt".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
