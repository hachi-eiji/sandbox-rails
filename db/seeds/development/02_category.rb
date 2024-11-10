# frozen_string_literal: true

10.times do
  Category.create!(
    name: Faker::Book.genre,
    start_on: Time.zone.today
  )
end
