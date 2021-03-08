class Comment < ApplicationRecord

  acts_as_votable

  belongs_to :post
  belongs_to :user

  enum status: [ :pending, :published, :blocked ]

  validates :commenter, presence: true, length: { minimum: 2, maximum: 240 }

end
