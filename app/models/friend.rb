class Friend < ApplicationRecord

  belongs_to :user

  enum status: [:pending, :accepted, :blocked]

  validates :friend, presence: true

  scope :pending, -> { where(status: :pending) }
  scope :list_friend_pending, ->(user){ where(friend: user, status: :pending) }
  scope :list_friend, ->(user){ where(friend: user, status: :accepted) }
  scope :reverse_friend, ->(frd, usr){ where(friend: frd, user_id: usr).exists? }
  scope :friend_reverse, ->(frd, usr){ where(friend: usr, user_id: frd).exists? }

  scope :iam_friends, ->(friend, requested){where(friend: friend, user_id: requested).where(status: :accepted).count}
  scope :you_are_friends, ->(requested, friend){where(friend: requested, user_id: friend).where(status: :accepted).count}

  def self.pendings_friends(user)
    where(status: :pending, friend: user).count
  end

end
