class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  with_options if: :released? do |release|
      release.validates :release_year, presence: true
      release.validates :release_year, numericality: { less_than_or_equal_to: 2019}
  end
  validates :release_year, absence: true, unless: :released?
end
