class Post < ApplicationRecord
  belongs_to :user
  has_markdown :content
  validates :content, presence: true

end
