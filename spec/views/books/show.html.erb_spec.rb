require 'spec_helper'

describe "books/show.html.erb" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :url => "Url",
      :title => "Title",
      :excerpt => "Excerpt",
      :author => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Excerpt/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
