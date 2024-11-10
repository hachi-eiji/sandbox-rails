class Book < ApplicationRecord
  belongs_to :author
  has_many :books_categories, dependent: :destroy
  has_many :categories, through: :books_categories
end
