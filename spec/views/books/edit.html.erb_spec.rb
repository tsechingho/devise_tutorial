require 'spec_helper'

describe "books/edit.html.erb" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :url => "MyString",
      :title => "MyString",
      :excerpt => "MyString",
      :author => nil
    ))
  end

  it "renders the edit book form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => books_path(@book), :method => "post" do
      assert_select "input#book_url", :name => "book[url]"
      assert_select "input#book_title", :name => "book[title]"
      assert_select "input#book_excerpt", :name => "book[excerpt]"
      assert_select "input#book_author", :name => "book[author]"
    end
  end
end
