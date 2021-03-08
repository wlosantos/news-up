class Friend < ApplicationRecord

  belongs_to :user

  enum status: [:pending, :accepted, :blocked]

  validates :friend, presence: true

  scope :pending, -> { where(status: :pending) }

  def self.pendings_friends(user)
    where(status: :pending, friend: user).count
  end

end
