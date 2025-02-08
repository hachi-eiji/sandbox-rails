# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books

  enum :gender, { male: 0, female: 1, unknown: 2, none: 3 }, prefix: true
end
