class Friend < ApplicationRecord

  belongs_to :user

  enum status: [:pending, :accepted, :blocked]

  validates :friend, presence: true

end
