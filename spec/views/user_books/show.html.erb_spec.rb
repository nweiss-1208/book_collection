require 'rails_helper'

RSpec.describe "user_books/show", type: :view do
  let(:user) {
    User.create!(username: "Enrique")
  }

  let(:book) {
    Book.create!(title: "No Lies Left Behind")
  }

  before(:each) do
    assign(:user_book, UserBook.create!(
      user: user,
      book: book
    ))
  end

  it "renders the username and book title" do
    render

    expect(rendered).to match(/Enrique/)
    expect(rendered).to match(/No Lies Left Behind/)
  end
end
