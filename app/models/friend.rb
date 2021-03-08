class Friend < ApplicationRecord

  belongs_to :user

  enum status: [:pending, :accepted, :blocked]

  validates :friend, presence: true

  scope :pending, -> { where(status: :pending) }
  scope :list_friend_pending, ->(user){ where(friend: user, status: :pending) }
  scope :list_friend, ->(user){ where(friend: user, status: :accepted) }

  def self.pendings_friends(user)
    where(status: :pending, friend: user).count
  end

end
