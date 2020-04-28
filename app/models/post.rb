class Post < ApplicationRecord
  validates :body, :title, presence: true
  has_rich_text :body
  has_many_attached :images
end