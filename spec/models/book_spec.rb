require "rails_helper"

RSpec.describe Book, type: :model do
  it "validates the title" do
    book_with_title = Book.new(title: "Waiting for Graduation")
    book_without_title = Book.new(title: "")

    expect(book_with_title).to be_valid
    expect(book_without_title).not_to be_valid
  end

  it "has an author attribute" do
    book = Book.new(author: "John Smith")

    expect(book.author).to eq("John Smith")
  end

  it "has a price attribute" do
    book = Book.new(price: 19.99)

    expect(book.price).to eq(19.99)
  end

  it "has a published date attribute" do
    date = Date.new(2026, 9, 13)
    book = Book.new(published_date: date)

    expect(book.published_date).to eq(date)
  end

  it "has seeded books in the test database" do
    expect(Book.exists?(title: "The Hobbit")).to be true
  end
end
