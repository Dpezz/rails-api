class Comment < ApplicationRecord

  validates :body, presence: true
  validates :article_id, presence: true

  belongs_to :article, optional: true
end
