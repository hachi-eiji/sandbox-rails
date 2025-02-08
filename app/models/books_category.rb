# frozen_string_literal: true

class BooksCategory < ApplicationRecord
  belongs_to :book
  belongs_to :category
end
