# frozen_string_literal: true

categories = 10.times.map do
  Category.create!(
    name: Faker::Book.genre,
    start_on: Time.zone.today,
  )
end

100.times do
  author = Author.create!(
    name: Faker::Name.name,
    gender: Author.genders.values.sample,
    birthday: Faker::Date.birthday,
    debut_on: Faker::Date.birthday,
    like_book_memo: Faker::Book.title
  )
  publish_books = rand(5)
  publish_books.times do |index|
    isbn = Faker::Code.isbn
    Book.create!(
      author:, isbn:,
      title: Faker::Book.title,
      price: Faker::Commerce.price,
      published_on: Faker::Date.birthday,
      book_jan_code1: isbn,
      book_jan_code2: "192#{Faker::Code.npi}",
      categories: categories.sample(rand(2)),
    )
  end
end
