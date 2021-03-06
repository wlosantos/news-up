class Comment < ApplicationRecord

  belongs_to :post
  belongs_to :user

  enum status: [ :pending, :published, :bloqued ]

  validates :commenter, presence: true, length: { minimum: 2, maximum: 240 }

end
