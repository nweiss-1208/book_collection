require 'rails_helper'

RSpec.describe "user_books/index", type: :view do
  let(:user) {
    User.create!(username: "Gary")
  }

  let(:book) {
    Book.create!(title: "Nobody Like You")
  }

  before(:each) do
    assign(:user_books, [
      UserBook.create!(
        user: user,
        book: book
      ),
      UserBook.create!(
        user: user,
        book: book
      )
    ])
  end

  it "renders a list of user_books" do
    render

    assert_select "td", text: "Gary", count: 2
    assert_select "td", text: "Nobody Like You", count: 2
  end
end
