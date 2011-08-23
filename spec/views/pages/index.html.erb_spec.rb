require 'spec_helper'

describe "pages/index.html.erb" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :url => "Url",
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Page,
        :url => "Url",
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
