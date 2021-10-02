class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie_id, presence: true, uniqueness: { scope: :list_id}
  # comment cannot be shorter than 6 characters (FAILED - 1)
  validates :comment, length: { minimum: 6 }
end
