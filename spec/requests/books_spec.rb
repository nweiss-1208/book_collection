require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    it "creates a book with a title and rejects a blank title" do
      expect do
        post books_path, params: { book: { title: "Over the Bridge" } }
      end.to change(Book, :count).by(1)

      follow_redirect!

      expect(response.body).to include("Book was successfully created.")

      expect do
        post books_path, params: { book: { title: "" } }
      end.not_to change(Book, :count)

      expect(response.body).to include("Title can&#39;t be blank")
    end

    it "creates a book with an author" do
      post books_path, params: {
        book: { title: "The Hunger Games", author: "Suzanne Collins" }
      }

      expect(Book.last.author).to eq("Suzanne Collins")
    end

    it "creates a book with a price" do
      post books_path, params: {
        book: { title: "The Hunger Games", price: 10.99 }
      }

      expect(Book.last.price).to eq(10.99)
    end

    it "creates a book with a published date" do
      post books_path, params: {
        book: { title: "The Hunger Games", published_date: "2008-09-14" }
      }

      expect(Book.last.published_date).to eq(Date.new(2008, 9, 14))
    end
  end
end
