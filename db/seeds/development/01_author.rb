# frozen_string_literal: true

100.times do
  Author.create!(
    name: Faker::Name.name,
    gender: Author.genders.values.sample,
    birthday: Faker::Date.birthday,
    debut_on: Faker::Date.birthday,
    like_book_memo: Faker::Book.title
  )
end
